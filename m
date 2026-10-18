Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAF43F106D
	for <imx@lists.linux.dev>; Sun, 18 Oct 2026 17:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792342817; cv=none; b=qBZbH1SLhCVAM0T27G7icmuTr2CE8AGTs5aF3LSsqi9iu5GB8C8zr0I5C9z1N285WXYR9+mzrz94MOHMR9OLEdCODK4z7ws0NWf+J0R6M8yCkUuFPbMQF4lm41QuQtu+dHFT2RlSSGa/kC1ics80EZR8EaAAvNyhqb2sjz4ld9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792342817; c=relaxed/simple;
	bh=j6QwPSkInJeEhrzmgYZqfRvcEPRt7b6y26e5smlmvys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hbfU0pKIl9H1BA4FvxPXuiuzvQ7AzylcMpIMbExLdqC6qod8owDjKH4zLrdh5Q5HChSjW1H+CJHdNBUaZdiTQedmEAibYOLTJbEc+QS5tdLcLiQwOxGCqjanWdJiU7H4rhBonBAETEcqnSUQHjUwPn+QSUCroueBRV+K2cA1oWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kWdjjel7; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kWdjjel7"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dee593f18so929585f8f.3
        for <imx@lists.linux.dev>; Sun, 18 Oct 2026 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792342814; x=1792947614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UqQp0/X3a9cfP9CawrgORU5i80U6c5G1RMObrYCGUFU=;
        b=kWdjjel7gNskqAm+qGWv0wLX5Jh4PHtEPS1MYZObb23k4X7UzrPGtx20s7RfnnRwB2
         U9Wf2V0O/lfyp3MF+MhB8Q9k0VNROTkwE0BZ1Z/j5Jv0V+MIRbsPUxDgiXEfItpkYXL/
         SsBqxNYeqzDygK+pk7DBY/inrLV1ESJlV/bseqXaIusFxnIAm0+ZP0ymdaJdTrfebI+D
         cca+iAa6HdCZ2gpXAcLg2QLAWPXdFM/lmmt7CCeO4pINMcHwZ3noFYzh5ZBM9qy9tI0X
         KGSWWPGjkaBQgzwNn0M+LwsYl8rNt3QrFW4/j0SL9EU6c2/8FAU38qEB8TP/Kdnpt3Ue
         klng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792342814; x=1792947614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UqQp0/X3a9cfP9CawrgORU5i80U6c5G1RMObrYCGUFU=;
        b=JFj97XGq3s7JHa2uDFOXCt/zCsJQvZp5PSq/1QgVlmvv1L8aq6yMUsYqUMv9EoxEJA
         txSUJiNm/jTJfifnZNUpDbBw4GTzjl1+4g/1GsJeV5/s9UtR3o1tPgnlQIGPrDwU34R6
         F2dym+ZjWV7PDo7+phMYSnjwwg0X1+x4Y4KmWnn2Ei0ZGajFcghSsfl9cZXHy09/n4Lh
         J8u/MQNfxAzPnn8epR4TjNdbHeZYGGZfcd0Fq6B6vWxgyTPgII1/Utjq7mN2OSmhezET
         lvyHrjmo+J+GWuRnnGuJiWLH0whhAzD/DpTk3/YJ73uCTt3MsBI86dkMD7OzM6he3x6I
         5/1w==
X-Forwarded-Encrypted: i=1; AKwUvBwUp3LmFlrCKz3MFUuHDLqTfX3Mz593UxKtZih9EHQBSdaLO6gPPEHoxgX/1nZhiDm9NTE=@lists.linux.dev
X-Gm-Message-State: AFq9FYKIPDpwScIhClX69yA/H8Wh6FxkW0ru1xyFDxDuillg/8dou7es
	KSkW2/IZdJbghcnpyJtmfZnCm0WoUM/qsizmA5ELc6AmPMcCJiZS6QRV
X-Gm-Gg: AYBFou16L5qvVeUhoQun2F0Z1XIqde61qdm8lD3gfUWeo5yqn/s6olWkP16pALytdBH
	lOyVV7P21QSwicZsGWWgNnEz563ASHuvinSaMVo7MyhZPvZho92azZ9cIcfVtlVf6amHeGeRuw4
	xC8NPIyp0rn5hb9zeHDDVtWsVROKlMPt8DrznNQx7qKwDTL658hEbSVy54+B051IxtGrQaCSrGQ
	1oV+csImwysdKD0GsPEaV1u6APSWMGmH5M65Y6bOBsn9egU0JM0uiaU1UPBlDyNSkTLE4kdAOuf
	801i8rK3a7Y2viTc4Wpq1NbBo3zD4iY1dNB39GBaRFGCvRFGjnddt3I1ph9IwbSvQVg7nmoW7FS
	ggUp/nSfv12pHHmuXvaBInuA+1bnljhsBAM7JEuhGLxViBHFeR4PDuAmVpCIV4TiSrGX1vxKMm/
	9AP2Jf3bhExnHNGdi1Q7Y3GJQLmWQgp3y7PINumsrDnIX9ftf4rxRG0XZYSqNGopeTmG9qtAzTT
	sxqMUDySJrf6Rr+IY+mV7/xWv2YGSnH665zP6gA4u6Bt1a8E36fwd/WedafhDHXL2jwf8UY9O4i
	uNxgdJstyIBaIdnWGNUg0qo=
X-Received: by 2002:a5d:4390:0:b0:48d:f025:110d with SMTP id ffacd0b85a97d-48e07fa9d49mr7744225f8f.43.1792342813663;
        Sun, 18 Oct 2026 10:00:13 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm19744454f8f.27.2026.10.18.10.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:00:12 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8mm-var-som: fix touchscreen IRQ trigger
Date: Sun, 18 Oct 2026 19:00:07 +0200
Message-ID: <20261018170007.38381-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The touchscreen interrupt is configured as level-high, causing a
pending wakeup that prevents Symphony from entering suspend.

Change the interrupt to falling-edge so the board can suspend
with touchscreen wakeup enabled.

Fixes: 5f67317bd967 ("arm64: dts: imx8mm: correct interrupt flags")
Co-developed-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Luan Rafael Carneiro <luan.r@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index fd0a1862ce90..5a60430eb96a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -192,7 +192,7 @@ ft5x06_ts: touchscreen@38 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_captouch>;
 		interrupt-parent = <&gpio5>;
-		interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
 
 		touchscreen-size-x = <800>;
 		touchscreen-size-y = <480>;
-- 
2.47.3

