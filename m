Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986031369AC
	for <imx@lists.linux.dev>; Mon, 26 Feb 2024 23:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708991152; cv=none; b=AvG5rBrLjVNXNa8FpnXz9A0zVlFaCUoFNriwG4+Klj8vb5C/fJ3yFI2D12Mu6QRoTQPxDgHtTWzkRotysArlvYGy43ewOJnLRl0iBCVIbk9+5IDUxCsxuow6Rq1HQXqhWRvL0xaEO55gn2aT+9uCUGq+goZfdTq7XShUbYHTDrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708991152; c=relaxed/simple;
	bh=dUKQStftk0NCvevS137ee+FAWx6tumN2ZluM+6YIhrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=efCnA6uxLP+2m517u3BM/EB+bG/YfXVFbgxWc/jsicmqhD9LNyuoyibMYigdc9ZFei3+zZuqxu3CYE+A4zp4ZHRFBnmoEjAFfL6bERnyJSpujQWdRWHUoZzHHKfc4q+ZLhjiLfbFnlFlbvhuVfp/oS3RU6in1aB0GK9D98AvUtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgJzm67o; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgJzm67o"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7c794deb6cdso171085939f.0
        for <imx@lists.linux.dev>; Mon, 26 Feb 2024 15:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708991149; x=1709595949; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knPaTIoFneZG5hrVEsT/YmqDcycwgQYY5PSRLonRAH0=;
        b=DgJzm67oBhX0KqNghXg8lCR+/Al/m+zzdmFbzqq5GOJ6hOTBlET9H6GGyPnhSbeUre
         GeHWVPFw1h9j2zFJkGoJtDsXFK+MU/vszMMIGsYNvpfF0wKVlmKYuR2O9A3v1Tyey2r0
         1Rc5a+enuuQrnERbF9i0bgDJkoWJPTAcYUVbF/ryD1eaWqXrPLje+il7s+i+Ji6pY+eN
         GcvMZ/W0xpayGiVHBQFe0XhyFL6K0xk1T2KXyLzO2mVc89SbNHKn6rnS+eUONcush2RX
         X0M8Sj2Xq7fL4Lm0jRUb/ThHJFgfcG7xcX1N3tETaT3V3OBS/ff4ux8TL+1jar3sCMcu
         BXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708991149; x=1709595949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knPaTIoFneZG5hrVEsT/YmqDcycwgQYY5PSRLonRAH0=;
        b=a1/NCA6hnCayQhL7PcncG12CYDi2z7nwdwpwg5jHU0Mcb10/bZJVvqe4IvRbpstZCH
         7YJ6UMsxBFTiuJXXx8imVf8KhFu+wAE4IqSgCB5FN52ZdCzetcfpOkon7phrGQMWzc1O
         mflUozy7bKrqww9vbWoLDmR0RXjpWEf8JFO4Z/hp0BDoYn+nV46vBTv4sCXPiApYDcuU
         KYLo1vnIOVJTKNXhZOYpudRYoyDXe9iMrCx3M60Z5an1GOc5WoOsB5Qq5EudOuC8vXrV
         p3VIAej/6Hmolk2n1vJ9vif4r56eWY97oAsRASF+5paoO5VD/RRqp/r2XYb6k2WbRUUq
         bnuA==
X-Forwarded-Encrypted: i=1; AJvYcCWqm/Il9LLNSH1yADzZ+gAALPnv3N2WF46H3swDv8ZIh7WJQtGXrEo77OrDX/w7nUrguVU0qtKi/QilkmAbW4xyo4Xt
X-Gm-Message-State: AOJu0YyS7g5BBmgUXr+HviS/FCYurunQJ8vzgHuTn8WocmF6uAjuVwv6
	OoAH1kkOR97crL8rmMOdQLAl9VqLYibwv1uDZiuwJmvCuvbsefdU
X-Google-Smtp-Source: AGHT+IHGXdeE0h7LKc2vsghd3XmTbOAHJo4wOu7BDYc0A1aaAW0t4XuHxS/AkRYcn3LhNnYqHf+PQQ==
X-Received: by 2002:a5d:91cd:0:b0:7c7:97c2:f04f with SMTP id k13-20020a5d91cd000000b007c797c2f04fmr10088960ior.8.1708991149640;
        Mon, 26 Feb 2024 15:45:49 -0800 (PST)
Received: from aford-System-Version.lan ([2601:447:d002:5be:9c95:d061:819a:2ab2])
        by smtp.gmail.com with ESMTPSA id c25-20020a023319000000b004741cf1e95esm1545317jae.11.2024.02.26.15.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 15:45:49 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V6 6/6] arm64: defconfig: Enable DRM_IMX8MP_DW_HDMI_BRIDGE as module
Date: Mon, 26 Feb 2024 17:45:17 -0600
Message-ID: <20240226234532.80114-7-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226234532.80114-1-aford173@gmail.com>
References: <20240226234532.80114-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX8M Plus has support for an HDMI transmitter.  The
video is genereated by lcdif3, routed to the hdmi parallel
video interface, then fed to a DW HDMI bridge to support
up to 4K video output.

Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
V6:  No Change

V5:  Added Review and tested-by from Luca
     No functional change since V1
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 34681284043f..ee644d27652b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -887,6 +887,7 @@ CONFIG_DRM_ANALOGIX_ANX7625=m
 CONFIG_DRM_I2C_ADV7511=m
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_DRM_CDNS_MHDP8546=m
+CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=m
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
 CONFIG_DRM_DW_HDMI_CEC=m
 CONFIG_DRM_IMX_DCSS=m
-- 
2.43.0

