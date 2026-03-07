Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117BC3A6EE2
	for <imx@lists.linux.dev>; Sat,  7 Mar 2026 15:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772898926; cv=none; b=kjC3u3LvMxn8iuzuPKK58ulS+o7cwMUIbDbkJoyfMKNJoUjg4LcZMcNrukDJMY5EO57Yo6AdZIIIlowW0iUHdW29ydK8ZoAZqtIbhLmjr92ZwDorux/yfSnhu9QZAhV7nbGlv5kXgkTHisszC4M1XoZwbETT0InuK+kCA8RNMsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772898926; c=relaxed/simple;
	bh=YTAQHlqjkAxn4El3X7x1Lp3Qz9qsIbPFg5XrrhvDXwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cx6YOzUwICBwNsgBhgpCt5ZORuSJ6oEY3C+XRJm9zDMzBgyj3u0pjoMcarLFFvty2ZyzP4r3gjVa3ogTnn7F8zabjO1qzWrRXhGFVUD53p6CgL2sbriDdYYxAJCKFSLE+8myETHQ9UT5K07Sp5bvtPTPSfn7nu32fPhARdgd8tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUeOqUrE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUeOqUrE"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-483a233819aso101141925e9.3
        for <imx@lists.linux.dev>; Sat, 07 Mar 2026 07:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898921; x=1773503721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5K4jcVb2WAVGgJfdO+e2rSdDaBiiC4SvELyV5iW+ww=;
        b=RUeOqUrENPY7SIAvNog4V7dBtkvYfsKs4j7qqv5VeFqh5VArnfYHZFJwFwW/tIyDDx
         1SSyp0NXVx8SZbFM62UF6IXittgSF7H/WR4RGS1Vxugm1GmPciW35i4RnZoLDWhOt++5
         CKzeBozAvcqmCnubFBsEynlAdCkIkgChX6+Abx17m7pwi8dm3RgE1OV7Q6PieP9ik3Bu
         sZ1gfk1GNAoMCDZKozpfyRrcrshT21GtolZlw1Jla+hdh8oOhnOdyh7v/ZSxLPHBRDX/
         tMsXuHcH79n7TvVnLMkF7tRjW5jip1dnPhJSEzK032Ew1Npgg42n0erbF0i0vh/hKIqm
         Npjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898921; x=1773503721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U5K4jcVb2WAVGgJfdO+e2rSdDaBiiC4SvELyV5iW+ww=;
        b=rbwh/w15mOPlMIN/UeDUp5C1EZtX71vVpoTg9Q89wffT/ilaE2EstMwIjj4oFygufH
         5d3fcbJLga7nDszshO0G5Hy2y1PSSY5355KTl8d2ApUEt7W4vsBm91J6mGs04lSQGrok
         ryoR0ohtNT4abTG5G5Juo5wS3V/eNrdYKAWURf4nVZMmA27ei6Ny01S81tIVF9Zl0njO
         cB5z4ZPk4iy72vaH2WHZI1bkZoV1NFNtxJF3igIPxCINZa68lKJ/apCrZS5QiFEoyTUC
         a+FKH/jZnSzE5wImgRe3yX/+DBzcbxqWrweNQd9FACtbN0EMrvhS/1ljdpPnvK2kGg81
         3g/w==
X-Forwarded-Encrypted: i=1; AJvYcCXNCf0SjSy1DnzopH3vB4uWn3zXvU2tlxtjcQMBiQjufvCBRzw/GGzJ8C9klu0E2BbbO3s=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpKAgbCTyDVuclUhxhvxMV+eX7wVjfmOcD+okHhjmOvuYcl2OT
	wb+uS+1wtAeNJrlTIduBdLWTuhC+QGLEl3uSIofykQ9bDXgxMdTAJiV7
X-Gm-Gg: ATEYQzwn1NnWGzhLYFmgsrN1mMBCVuYgchbhATvUig6TED2/03XmULFGRg5OF9QHbUd
	dztBW+Nmd8eT9KTD9rkzVThZjw79Ghke4r3HyTFgKWrxxn8HxzDJS1MhL2ofatXupVuuXN7TeZh
	F+BUuTsMxcJF6vwD3CP6YlGfHYz7S5hixgFGiqHr4C8KyLX2cXjzwBahJjYdvIWvtCDL1l6sZBD
	8XLrDS7wtH2pnQQJmpNkJd0GpcsgW04w8CdNXxi/UMNv64HTSevT6q3CBjyJefCoA2emjihgyq7
	K16W01V6yHKGKVlZLl+b6MSlhyNzAvZcjYji2rrMDsh1IOcdRVHnLQ17lwITEmKuwu6I6c0vzr2
	+Z174wWWYnDHe5ZvtzSeXg2EKhAv0/6kj5MGXz85sOASg9k1wXtSDKAXnCehl1Z5yoMfLLCzGQM
	L5HtoFeh0woKIMRlSnS0jQFWToqJVBgONtGnLqth/ClW9jbCTtg/ILUSMewxA8QMF7XO6ygosPL
	5DPiEd7IWZKnTm0SLP9AbIvHA==
X-Received: by 2002:a05:600c:3b0c:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-485269188admr96312265e9.5.1772898921081;
        Sat, 07 Mar 2026 07:55:21 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:20 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 09/11] arm64: dts: imx8mm-var-som-symphony: Add TPM2 support
Date: Sat,  7 Mar 2026 16:54:45 +0100
Message-ID: <72e21074031d16153460e128f8f37b8c942aaf30.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772898346.git.stefano.radaelli21@gmail.com>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the TPM2 device on the VAR-SOM Symphony carrier board.

The ST33K TPM2 is connected over I2C, and A PCA6408 GPIO expander is
used to control the reset signal required to release the TPM from reset.

This patch adds:
- The PCA6408 GPIO expander.
- The ST33K TPM2 device node.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx8mm-var-som-symphony.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 66c306f755af..a77085b264e5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -160,6 +160,20 @@ typec1_dr_sw: endpoint {
 };
 
 &i2c3 {
+	pca6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pca6408 4 GPIO_ACTIVE_LOW>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5406";
-- 
2.47.3

