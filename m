Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE075304D4
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 14:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075623; cv=none; b=uEP9UtW07xbbCncO7tunr5Zvj0yv81fQNkMBt2j+Y6ue7I9+JY5AzZS/uEVKlhr1HW02zJI7tO2dus6dl99y2/dksLA7jnzHdZV60o7GEMPMAOwFbz1hfrLjwjOG8NAZ3VlKMBN9qAzzWCAidP27bF4sW1RDLxRne4MmIT+bX8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075623; c=relaxed/simple;
	bh=iC9DN0Sjs9ijrGYXSch8NNYrtcI4yW7Tfh/t6BjbqPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=umveA36o4r/aAfIw1ryLUYexBGfS1wA5f7z+P7/H+fTueLI1qTWj0lnYTsAsJIgspMd9Ei79EBh0kjCKjOTKJ7g5JqrQT2iqTOFeRRSSN9lEieRc0HnttEiHyKx3yfsDk7v3wYW0LVzTYVnQUZOysrdJ8gv4zqEVk45o9nkU0ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=ossystems.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b1afdf5196so1822441eaf.2
        for <imx@lists.linux.dev>; Thu, 15 Oct 2026 07:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075620; x=1792680420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1Sj8rSdmb/pbigDyObZpWX/JDYcZPR3uB5iI75Xx8c=;
        b=A1PQsd4yAvdMBjIiaX6fqTerNiHB8W+7KEWy0tjpT7USBjFWZ0ozxGSTmnwR9lc2D8
         aUQWl6f6B1kxih7sWRAql1F86nLMI/idn2yKp0A6zwDFTHRQbGOhlHT8/lF+TonUbypw
         4xLQ38jRplGHaavhJFin2rGK7z1ovPQf3Fv1EqZ5SWYRx6Rdyn3jJJVh6ekqX5t+tLY6
         yxxvjSMfMiESr1zYtpWozcr7g5kaoh705Zhom6Dv42RGQSIxxM+Nb88mDrjAQkLgm+W1
         7OglXyjH3nqoEfcQuhPhsFHiHYDvm70NQeD/Sx6GPuOZSTZljXsuU6kifiBU8h/swBux
         a9dQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiGlcekNgpLySe/rpHa+/gXcaDu/Kesz0dndFkZ00twIjQCMA5sUZ9vWhXtYLkx6fD/0I=@lists.linux.dev
X-Gm-Message-State: AFq9FYIk+2OkIPylHF9Hb6EyQj4070BFaY2X4oi1YeMvc32bKahj+Jgg
	eHhFXlM3ildhUVxmTXjFrXsEzwhIMEE307zP5o3nqKE3cAJoaxDm95X3
X-Gm-Gg: AYBFou1q1x7xkxMzDI2/60437T0xGe4VyoH9HW57Ma4fbg2ZNismras1HIeB2BxORaS
	okMupEr3FWgjYjERtN+V8lkaZqHCkRcVsQMazC6TaGBjT64DnU4EHO0izN3k1nQKBrac73HIVt9
	Kom6DK21dmSNi6eF1HB21NvGrdDUgjJyG3oPskELzWG4lVYy6I1IpxrPddMnsBgiyYzouMLpxCz
	Oc9i6SdqW6dsh70nzJ6JqLEIDf3TeaFiMHBd94P7aFzpnhWkYy+eloGPcpdHR9cPfF0bUqXU9FB
	H5KykZx9t8aPOBRl0lgFcgLlVaP6+7WQ9n/GU9gxTkCOUYeN30c0NUtwKkyU1Sh4FkVALiF/ViU
	M9pk6scNtCiwBFbuw0hNawCr2hYQv4LxGrTZRg8JpAiU4W61c0eNYTBAxg0AZHWpTcQSU2LufyL
	/icD5HDa6eJSd914XXqrcb8jZm7wuiygoH+sTeNGtWczJ29oCVoGPlWL+cXZZI5ymbd+lPPrr8T
	6/BiaU4YIi0kEAi0+IikSTDdgIR6T8wHD+81CC/0/dfQ3iVickDQqAc2rf/dMlkLotvievfYBJY
	UPtHWhxNj+GyM42PQMdrVqAbnAkPJp7E11VX39BZw7khIYM29ncYignsc0jMU7Ov2PgZL4tE6yy
	fVZl7crGnqk4=
X-Received: by 2002:a05:6820:162b:b0:6f7:6416:a34 with SMTP id 006d021491bc7-6f764161ae2mr8416735eaf.41.1792075620353;
        Thu, 15 Oct 2026 07:47:00 -0700 (PDT)
Received: from localhost ([201.89.183.74])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfc982a4sm4664115fac.14.2026.10.15.07.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:46:59 -0700 (PDT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Otavio Salvador <otavio@ossystems.com.br>,
	"Rodrigo M. Duarte" <rodrigo.duarte@ossystems.com.br>
Subject: [PATCH] serial: imx: keep the CPU out of deep idle while an RS485 port is open
Date: Thu, 15 Oct 2026 11:46:27 -0300
Message-ID: <20261015144627.2461915-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In RS485 mode the driver releases the transmitter (RTS/DE) from the TX
complete interrupt. On i.MX6UL/ULL the imx6sx cpuidle driver offers an
"ARM power off" state with a declared exit latency of 300us, measured at
up to 2ms. When the CPU enters it while the last character is shifted
out, DE is released that much later. Modbus RTU slaves may answer after
3.5 character times (1.75ms at >=19200 baud), so the head of their reply
collides with our still-driven transmitter and is lost.

Add a CPU latency QoS request of 100us while an RS485 port is open. It
excludes the power-off state but keeps WFI and WAIT (50us) available, so
cpuidle can stay enabled and the constraint only applies while the port
is in use.

The request is added on startup and removed on shutdown, and its value
follows the RS485 state in imx_uart_rs485_config(), so RS485 enabled
through TIOCSRS485 after the port is opened, as libmodbus does, is
covered as well.

Tested-by: Rodrigo M. Duarte <rodrigo.duarte@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 drivers/tty/serial/imx.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 986fefb45c632..be05ed94bf0c4 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -24,6 +24,7 @@
 #include <linux/ktime.h>
 #include <linux/mutex.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pm_qos.h>
 #include <linux/rational.h>
 #include <linux/slab.h>
 #include <linux/of.h>
@@ -237,6 +238,7 @@ struct imx_port {
 	struct hrtimer		trigger_start_tx;
 	struct hrtimer		trigger_stop_tx;
 	unsigned int		rxtl;
+	struct pm_qos_request	rs485_pm_qos;
 };
 
 struct imx_port_ucrs {
@@ -339,6 +341,22 @@ static void start_hrtimer_ms(struct hrtimer *hrt, unsigned long msec)
        hrtimer_start(hrt, ms_to_ktime(msec), HRTIMER_MODE_REL);
 }
 
+/*
+ * In RS485 mode the transmitter is only released from the TX complete
+ * interrupt. If the CPU sits in a deep idle state at that point, the wakeup
+ * delays the release long enough to collide with fast responders on the
+ * bus. The i.MX6UL/SX "ARM power off" state has a 300us exit latency and was
+ * measured at up to 2ms, so keep the CPU out of states slower than this while
+ * an RS485 port is open.
+ */
+#define IMX_UART_RS485_CPU_LATENCY_US	100
+
+static s32 imx_uart_rs485_cpu_latency(u32 rs485_flags)
+{
+	return rs485_flags & SER_RS485_ENABLED ?
+		IMX_UART_RS485_CPU_LATENCY_US : PM_QOS_DEFAULT_VALUE;
+}
+
 /* called with port.lock taken and irqs off */
 static void imx_uart_soft_reset(struct imx_port *sport)
 {
@@ -1585,6 +1603,9 @@ static int imx_uart_startup(struct uart_port *port)
 
 	uart_port_unlock_irqrestore(&sport->port, flags);
 
+	cpu_latency_qos_add_request(&sport->rs485_pm_qos,
+				    imx_uart_rs485_cpu_latency(port->rs485.flags));
+
 	return 0;
 }
 
@@ -1710,6 +1731,8 @@ static void imx_uart_shutdown(struct uart_port *port)
 
 	clk_disable_unprepare(sport->clk_per);
 	clk_disable_unprepare(sport->clk_ipg);
+
+	cpu_latency_qos_remove_request(&sport->rs485_pm_qos);
 }
 
 /* called with port.lock taken and irqs off */
@@ -2053,6 +2076,11 @@ static int imx_uart_rs485_config(struct uart_port *port, struct ktermios *termio
 		imx_uart_start_rx(port);
 	}
 
+	/* The request only exists while the port is open */
+	if (cpu_latency_qos_request_active(&sport->rs485_pm_qos))
+		cpu_latency_qos_update_request(&sport->rs485_pm_qos,
+					       imx_uart_rs485_cpu_latency(rs485conf->flags));
+
 	return 0;
 }
 
-- 
2.55.0

