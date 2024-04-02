Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FBC15CD5C
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 19:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712086556; cv=none; b=gjeW0LhWbn+1/Ke7cTQHqPNfmcSd7+2I7l9yISRP5aAILJvaI43ikt1fLVJVK68QDGQOpD4fu+ejqRNIei2VQFbXCTxZ75sj6e2qnFglIwDLP7JYhBFGfjNoERBuVmgjmRV3TfTZXIqCF5IkpIHo+l34Bc85gCm55lD9I9aPX2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712086556; c=relaxed/simple;
	bh=0RvejRjIJPduOyyCTlLj3EvG2tcNMQT1bKnp5UWuaPs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tzaUxJrSKIWE1Ib99yXz2RRf9RXTHDQdvQsFSoNknHTwp7+vlACByQKg/ziS7pvmu8LSFryHGyHjX04FvrpliGQMvuEw/8iWQ3JCyCx5y/nbDoBpPIXoktqXmJzS60Jyos4HPRGZAUzb3t6bwga1F00RADA1FuGNDxpAsPSli5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBvZD5IC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBvZD5IC"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1def89f0cfdso1815455ad.0
        for <imx@lists.linux.dev>; Tue, 02 Apr 2024 12:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712086555; x=1712691355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHKgofjtLfTWJ/FAwhBqVxJWAROfQE6XjH/ZqxNReeE=;
        b=hBvZD5ICbZeQS+ldFshMIKLWe9OYqe6wXnxEOMIElbsGGAUBCofpwNIU1RPBYL1Abf
         O3rytxE5pmnjmS9rsSsCvv8BB8SnQnMoeubvK3wo1FUa64BY5APIBwJfCQIr1WocKo8J
         OnbayIzsdN4PsNryRj7+6zv20Qlcm1DHAOsxLySGsChFrubb/tpgTN8wjapK2QW7tSk6
         tjBWdJlav1RbaSb7P1vfkFPGS1EGuZMgC3kRA0XuGkJG9G8QIdQupt4zgL8DLRF1xw/e
         faBFlWyqHlAoArvzb/VsWc+UfNkW9/0nA8z01XFqk+ahSrCN5z92XflinItQF2GT61mk
         +p8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712086555; x=1712691355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHKgofjtLfTWJ/FAwhBqVxJWAROfQE6XjH/ZqxNReeE=;
        b=fQGHAEBUPAhjhMPsdoAjxoQJ/GL7i/bf0/hM6rQ3Tljh3c/k0S+q6tAAdl+Q/xXmSB
         2QcEfJoFE1tgFQwWHhMn4ynnq0bZ65LoHiuA5yYC2SxUOv3lFUVHs8ZJK2njMeJTl2Pa
         k/wuOqp+ZvHEPH3rLqYH0w0lCwGMu98PphSRaTTYbnY8mkFSCu/t9pldwkXLc5pmB100
         bIVwR1gxDotB7jbQu6rI/7EJMLcYaK3ToXZnagixddymE99H9O0aTrFVamm5pzKNxedB
         ZWG27LHdwl3j/fvO/qQ5YD9tMZjKbEIzhCUs9t+/jwAY/PdU/kRfcoUbeNChdJqxV67h
         GNUw==
X-Forwarded-Encrypted: i=1; AJvYcCUAXVmfaR6ye7zFD8nb/5D5yL5qh9k3rBSfpngAuMKOEO8+shqR/vzLp+zVR8R0aq3PP0FyFUQH0WtEO7bC42CINgUk
X-Gm-Message-State: AOJu0Yyk90U3RHw5c/l7/s8/hSMa1nm0sE45NtqkPtv3cN6nOmbG/C9b
	hAggYCItWqvTaTvkrr0u2Qg8sgs/Y+g05+6io2jm9rHzMaO7l4y/
X-Google-Smtp-Source: AGHT+IFo4t051oCixR4x2puMKN9+F3XA0BHfQTTOfa7GG3oxo+qvOGVEAXWPPM1McWQQCcoNyHTzLQ==
X-Received: by 2002:a17:902:f54c:b0:1e2:76ad:caa with SMTP id h12-20020a170902f54c00b001e276ad0caamr580629plf.22.1712086554826;
        Tue, 02 Apr 2024 12:35:54 -0700 (PDT)
Received: from frhdebian.. ([2804:14d:8084:b86e:ac17:f518:b547:13a8])
        by smtp.gmail.com with ESMTPSA id g6-20020a1709026b4600b001dd59b54f9fsm7775841plt.136.2024.04.02.12.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 12:35:54 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] arm64: dts: freescale: Add i.MX8DX dtsi
Date: Tue,  2 Apr 2024 16:35:09 -0300
Message-Id: <20240402193512.240417-2-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240402193512.240417-1-hiagofranco@gmail.com>
References: <20240402193512.240417-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

Add DTSI for i.MX8DX processor. According to 'i.MX 8DualX Industrial
Applications Processors Data Sheet', the GPU and shader use a clock of
372MHz. Therefore, this dtsi includes the imx8dxp.dtsi and changes the
clock accordingly.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8dx.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dx.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx8dx.dtsi b/arch/arm64/boot/dts/freescale/imx8dx.dtsi
new file mode 100644
index 000000000000..ce76efc1a041
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8dx.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2016 Freescale Semiconductor, Inc.
+ * Copyright 2017-2020 NXP
+ */
+
+/dts-v1/;
+
+#include "imx8dxp.dtsi"
+
+&gpu_3d0 {
+	assigned-clock-rates = <372000000>, <372000000>;
+};
-- 
2.39.2

