package log

import (
	"context"
	"fmt"

	"go.opentelemetry.io/otel/trace"

	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
)

// log is A global variable so that log functions can be directly accessed
var log Logger
var zl *zap.Logger

// Fields Type to pass when we want to call WithFields for structured logging
type Fields map[string]interface{}

// Logger is a contract for the logger
type Logger interface {
	Info(args ...interface{})
	Infof(format string, args ...interface{})

	Warn(args ...interface{})
	Warnf(format string, args ...interface{})

	Error(args ...interface{})
	Errorf(format string, args ...interface{})

	WithFields(keyValues Fields) Logger
}

// Init init log
func Init(cfg *Config) Logger {
	var err error
	// new zap logger
	zl, err = newZapLogger(cfg)
	if err != nil {
		_ = fmt.Errorf("init newZapLogger err: %v", err)
	}
	_ = zl

	// new sugar logger
	log, err = newLogger(cfg)
	if err != nil {
		_ = fmt.Errorf("init newLogger err: %v", err)
	}

	return log
}

// GetLogger return a log
func GetLogger() *zap.Logger {
	return zl
}

// WithContext is a logger that can log msg and log span for trace
func WithContext(ctx context.Context) Logger {
	//return zap logger

	if span := trace.SpanFromContext(ctx); span != nil {
		logger := spanLogger{span: span, logger: zl}

		spanCtx := span.SpanContext()
		logger.spanFields = []zapcore.Field{
			zap.String("trace_id", spanCtx.TraceID().String()),
			zap.String("span_id", spanCtx.SpanID().String()),
		}

		return logger
	}
	return log
}

// Info logger
func Info(msg string, fields ...zap.Field) {
	zl.Info(msg, fields...)
}

// Warn logger
func Warn(msg string, fields ...zap.Field) {
	zl.Warn(msg, fields...)
}

// Error logger
func Error(msg string, fields ...zap.Field) {
	zl.Error(msg, fields...)
}

// Infof logger
func Infof(format string, args ...interface{}) {
	log.Infof(format, args...)
}

// Warnf logger
func Warnf(format string, args ...interface{}) {
	log.Warnf(format, args...)
}

// Errorf logger
func Errorf(format string, args ...interface{}) {
	log.Errorf(format, args...)
}

// WithFields logger
// output more field, eg:
// 		contextLogger := log.WithFields(log.Fields{"key1": "value1"})
// 		contextLogger.Info("print multi field")
// or more sample to use:
// 	    log.WithFields(log.Fields{"key1": "value1"}).Info("this is a test log")
// 	    log.WithFields(log.Fields{"key1": "value1"}).Infof("this is a test log, user_id: %d", userID)
func WithFields(keyValues Fields) Logger {
	return log.WithFields(keyValues)
}
