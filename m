Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A0528DF0B
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 19:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757966041; cv=none; b=EgfH5vPWbUcP5R6GtycwYV1tC2MVm4j3u1yqRU99qMzkP0EiwhlOf5URIwzyHeUj/jEM/bynyCRvvf9vsfq1A1eClvNv9WaOTgwfCX1PqN+X3ZnyIUpTMqYJK0a2zxQSpxlpZBq78rgj9gf50lnj5X+R1I7wcBIO4EqptdWwU7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757966041; c=relaxed/simple;
	bh=7R8rcOL3f1HwsUpPHaL0+BUAREAOiXb98Mm1tlgtyCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MdK7J87jfOr87OtNmtGAYOZC8GtOit4Jl+jS24f3ndT6j+4qrcW3ONlofg5JE2Ui0TKjzncOB9xL/l78RJay0tXRrGpxQ7c7WJ2svQo91WA8zEUO0leU8gOpWNrcjl4ptBEJTcWybxz4N1RX7yTXmY8ibs1uW1Jix4DaFb54qWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=V10Ni8oL; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="V10Ni8oL"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45f2cf99bbbso10137275e9.0
        for <imx@lists.linux.dev>; Mon, 15 Sep 2025 12:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757966038; x=1758570838; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ9ovkCr6DqOwPekQL9mbbfb8pXGwCeM0TnyH7IdLxU=;
        b=V10Ni8oL2LqAeWlyaNHYcwz9osYKhZYVVExKqleBx79+b1jdOLnxJzwZwdJwLAicEf
         7gbVYCMVz/OqyCDzrWql8De+xG8fhBc9/UP/5UGVDSJ+JcWrhMaruifUO99FrS1K4D+Z
         9Q2vEkCsCYWV0yrFMTMZtDQuAf9lU8xgciWLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757966038; x=1758570838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ9ovkCr6DqOwPekQL9mbbfb8pXGwCeM0TnyH7IdLxU=;
        b=RAG3mPD911jv+B67oqpPPwbhVf48qPYYttGhHc3FXqV28om93oHuNAGtu9pd49GHOo
         jA2beN+4BuE1TRgN3P8lU0yzUO9wRBKPHD3HA9DUy6YVkGbUnrUKjKIKDbJ12p8l7R+f
         KBv35urZbdNzss6y0kNU77g8nfnigSzeuhKRSJnvzk3yGQR8aeMc3PXY16qqof9H8GsE
         MfBDkssZVuNN27STEpht40xQbv+5e1v96Jck7hdbKVGTO4tVeUQKU+owoBuK6RxgIIiR
         n+QD9bzMplVQQ/XeMY9P3ZI/1qZIU1LzzHPs5upXha1ABoZDc88d+2lZpiMXxWN8Q0A4
         kIQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMnWClrwU8TxujSTOMNgo31E4HBTKPtDE8XEkpH7iVx2TWHhsVFV6HMjcP6j7U7QN5mdc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzXGJYHqsscPFT1Qbx0vpQbT7vSdZPwoOSiiTl9IhKIfHXfre1t
	HWXDTinzP/c0Yb3q3mz5nsjSBdS+DDjlbVMtrF8sXyUUpDsKl08M/XzF+/FiWR0Shic=
X-Gm-Gg: ASbGncvRNTrmB+CU3PVaiPmESMQNpEvWaHlUdVmoE9y/wa5afy0pVhBq3ckgpayviw1
	MAV3Zo/HzyLOIJuY1E2kK+uxuuznx8F14LyBGZaFqvQmSrBdRJst1jUMPfwDToGGb04CVNu2oDz
	YiwjsD7rtfId3UZuNlCvK8SyqbL9c7YQETyxdDv8vRtZ5ddXGZdv0uyBAfaL0LLA9FxvxZPWAMl
	X+I2UFO9VmxYz6UEjcjbk5Pnzwj/knNOYmaLkAL4vFCr2iIrt6kTLorceaiGbYI5QZs5FDC1GED
	qbvWbzdNfSV7UJsY/xs0QAOa+QEfSiL8tXCy28JmaVK4zVG2eppPIs9Bu8fMwTIbPqOHkbdnDuO
	iafkPY/FiDbQ6M8a2JRB6fmiru1g9ZVVOt7L1wrdxCehIK+nLcq3aX4uDyi/MpRs94KXIA1mRxw
	==
X-Google-Smtp-Source: AGHT+IFndz1AmdXVeKfJS9fz0y2h9S+/Rc1JyiVoAbeqVDR+ayQsA7o4g+R8GMH0hF64MGhaZdupYg==
X-Received: by 2002:a05:600c:6a06:b0:45b:8f5e:529a with SMTP id 5b1f17b1804b1-45f211d660bmr96982405e9.14.1757966038162;
        Mon, 15 Sep 2025 12:53:58 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32640f49sm530985e9.9.2025.09.15.12.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 12:53:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 5/6] ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch threshold
Date: Mon, 15 Sep 2025 21:53:07 +0200
Message-ID: <20250915195335.1710780-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
References: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This way the detected signal is valid only if it lasts longer than
62 µs, otherwise it is not sampled.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
index 279d46c22cd7..f12084d8f2a0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
@@ -154,6 +154,7 @@ &tsc {
 	pinctrl-0 = <&pinctrl_tsc>;
 	measure-delay-time = <0x9ffff>;
 	pre-charge-time = <0xfff>;
+	touchscreen-glitch-threshold-ns = <62000>;
 	xnur-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
-- 
2.43.0

