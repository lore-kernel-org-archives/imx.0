Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C905413AC1
	for <imx@lists.linux.dev>; Mon,  6 Jan 2025 14:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172223; cv=none; b=J+SQPhqLtoLLJ9Bh0rGNqJzbsCbZTAFcZ+06UYJaBN7J/+8tQe9pERaZAsk0ug0dBRmOE7IVrJezn/Ysq6HwZSfnB1e1J+yitVmC3HEEgOn6oaBvMdGldyfP55eBlcNSVDMgq9KKw2VRSWQ7XfS/ooV3ZVleNxzYSzja17Uhl0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172223; c=relaxed/simple;
	bh=x2eksJKSdXVDVuebuHcjHpwghOa96OpVmrVhc9fVacA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S3oIJ33+jWGAXafzfk2NVhSMm6vuZII5BQOPftkc+B9s7XW1TfRd4EODQ8mpqIlDXw0d/ennpx+FYlP/3K0sqpT4fXzY5ZyDBhUlVxxDojYwyvTm5OHNxORj6BPGOKGuuuAr/u4SD8DmugmvK+IdkqsbJHVCrNaPNAUJsTY0QrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3iMnxFc; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3iMnxFc"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-216401de828so194586025ad.3
        for <imx@lists.linux.dev>; Mon, 06 Jan 2025 06:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736172221; x=1736777021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kYuzMHGnD8E6XhCjcca6YSJC8fqqzUa5TU6pyjVh+N8=;
        b=g3iMnxFcGufSSUnrr+Y3esJV/yXKkVmxYgayr8mI8MUjVPda+5q7Xe+AWhb9I0lHDg
         QjUEHjozqx0FtUkIYYRhcGZnPHq6q4EmYuTpX0+5f3k9RE5glO2io2eby/S6HgaaqJhV
         Pj+CA6vvOWWYi/Ncghh4KvxJphualmygwPNYVJIbfSmMnip0geTQZSxHURSEry4TJzj6
         Z6Ebo+qvVcYTLBBvrDmKvpK5seWuVsiHsg9wfjabEt7GBrXDgDGvYn3jpSDz/duWE8u6
         +KFXO/bqgH4xUkDqVk2dhL7qbqzBQnp6C7SaUlz3sdbs4+rk4ckA7L2pyupraZa73JP4
         6pkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172221; x=1736777021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYuzMHGnD8E6XhCjcca6YSJC8fqqzUa5TU6pyjVh+N8=;
        b=E5Ht0dkOMGekvJWMNWs8K4o7vPf4eUyVWDX46EGafX5JCPo1bpM0iF271J2GuZdNT2
         QnFrcmjMaOOQqW/Ttuo3XUBFG+ZXudnCCmdsxWMmzAnWOSu+SS8WMx2YizlC6SoGJYO7
         8SkoOBcjidBgiU7EQO2D0LvzicBcbp3x26fqU18uFTehlQGZSNSvmN7fFAvEwjdFdpMG
         lZDZNlPfALADOAzKPAkY4tol/9gTODC6IsUnX7CZWbfX6g5S4w8EKYiuJS5yLUWxoJzt
         vafntsqhTF+s2YBE44RqCvCosdHeVI7ydi9x7/7yyTQRLavWfeUW0UDN6EFMg8hW2RJK
         sw0A==
X-Forwarded-Encrypted: i=1; AJvYcCXVJOoOHgydo0Ljh0t9I1oyAFzuQep+0QDqOhH0njtpHDRHQ+dpcQOiOUiIqhzJuEQLjzs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzVTTQ6K+0JA98PKkphd8PcrcpxIWHYUzePgYKglATz9iIcMVC
	3F1wv4QlKSK0NyecxmGV6pOCH1LREyU9RIZUUX3Vpx9qCyQ8zyHD8kA5uw==
X-Gm-Gg: ASbGncsAgi102+XwI54dhEBIkMFwGHOUVp06CYCbA1dJL+bzNRA9eHpaZGi9pVzgUPv
	5EDHjUDnYqxjEdf3kxck3WlbgDgqmHSxTQ0ZMYH0X3UufZtgy5PVkB5p8Ru5FpfYDij6Ll16Owl
	tlxuLRaEo2unBx8SkyIAp1N42ZGvfJOkZAt34zdoI8XN0HXnjigii9iKcxN+0Osa5XuMBvdtog6
	gYkaOQ2A9wqaBwBff2g9iREIbg/v2jKbQrmfsB6AKpE8n06siCzh06pYll0Fk1HRHfMG/U=
X-Google-Smtp-Source: AGHT+IGv/ZTw3KxrI0XtgNz3OOfnts53BzVuzKLJVbFuKl97oG5Jb1fBASVM2CQGYpUiyDEUaj9W0w==
X-Received: by 2002:a05:6a00:35c3:b0:725:ea30:aafc with SMTP id d2e1a72fcca58-72abdd3bf6fmr89544004b3a.5.1736172220757;
        Mon, 06 Jan 2025 06:03:40 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d4cb:2a53:2696:85ea])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8f90b9sm31341054b3a.131.2025.01.06.06.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:03:40 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH RESEND] arm64: dts: imx8mn-bsh-smm-s2pro: Remove invalid audio codec clock
Date: Mon,  6 Jan 2025 11:03:30 -0300
Message-Id: <20250106140330.2071858-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

According to ti,tlv320dac3100.yaml, 'clocks' is not a valid
property.

Remove it to fix the following dt-schema warning:

Unevaluated properties are not allowed ('clocks' was unexpected)

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
index c6ad65becc97..475cbf9e0d1e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts
@@ -64,7 +64,6 @@ tlv320dac3101: audio-codec@18 {
 		DVDD-supply = <&buck5_reg>;
 		reset-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
 		ai31xx-micbias-vg = <MICBIAS_AVDDV>;
-		clocks = <&clk IMX8MN_CLK_SAI3_ROOT>;
 	};
 };
 
-- 
2.34.1

