Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC3721CA05
	for <imx@lists.linux.dev>; Tue, 15 Apr 2025 17:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737667; cv=none; b=jzfGoCWRknoFsTP3df3BzCtP2Mc02dRRLuJAZn5cNQBhWdhA7fGcBCdYLS0gu/YYP+5FuHQHJ1/+wSCn5V1QnColHBey/5rAA/RXm9HraMW3iFif+ZopzHsdTE1IxWMInUMezT1bHdXKfVV4lJUbhk/aWseJ/xvEr3X4FNVX9dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737667; c=relaxed/simple;
	bh=jtozxlDlFArb33Vwn4r3NVMWeWlV1gMBeUBT/QzmsQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zn9/6oskOY08wKccW+XYdvmX7GoIr3dGQfLOrYFNNoQ7jpZb9ky+QWLSAMqbIbkWznfEQNK4cD8idPJOlHfdrfD1rrXmvuunOTPNLue8mTfY7d7TyVnGh5pvrm36933voeP03njPYS0Hw7dtdXF8KEZwXHMAYuJd2AjL5uZeW8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RK+2HSKU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RK+2HSKU"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c30d9085aso3726696f8f.1
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 10:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737664; x=1745342464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=RK+2HSKUq1Y3VO0jcY/EG8rp8PTW1vmc4wB1v6qvPc5cZKLcClOEUo8JIZC+fTZrP0
         9XV2nXhx5tvpSd248pV+cGRG30zdX+gI69DBBfv9Ci9imjC2S8KITADoaosuERnA8l//
         cE9qQzs+QhaHhSm2FFtbmCl3Ihym1ZO7sMSzVIRgyyMHhCD2sFdf2fkjXMvt9PiUzsPW
         v8AsHlnL0tNKG2CJHqf98Id8skuysdz1VhLoEWbD0MuRQvEbAy6Sjcyj0mPTW0B4DyKg
         qSCACCNeCbIqGAO8FdqgDaMnrx4+0Ve93mqNT+B3KGrRerQXBbd845eLZy9eBoQsdgMV
         SKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737664; x=1745342464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gu5G8CnhO94dSAWaShWe9FJyZsw97QYskm73IppyfbE=;
        b=Zs7G2ufB3p9/KNTzk9vxtynWAh+y/sJnCB3CQDWgPAVqe3gWwn5Coo84QCgBBscHv5
         qwEGFJ3XyViZfO/pnR/UCqbyw6x9ubs57QGxj1rgl4fW287IOQUye4dqKZEG4zUiCbB1
         w/ugFfGBRY2J3Nwy+cyvCX2NoMCyGvif0LPDYGq83hm5k+dx9oUbxDAkxe+ws6Y8kxbC
         wIA7qnwCLmJeJdUwF6E1xkl630gc7AMHn9bKjc+VWkbiBVX1liGn7dzsjPFWLO+uksaK
         aXP7gT/aVXW+8O7k2515rFjKiP45TMjiqsUYdyn/9ShV3eAcRk/M8Yuqgervm+OjHJwn
         0XQw==
X-Forwarded-Encrypted: i=1; AJvYcCVaMD8TlXMc+c3Zxv++VsKHHRyJn23mQXm8RCqHUkee4O4VuCnRK7q7CI81JP69e+3cvQ4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwDgQR4lA8P+nQVIfjFr1XuqDBE1A8FbIeTRSRFlkWjawl8jEw4
	EjibuWeJC+1/ZGCcRxcr8Zg/0xPa4LwoWeHme6cDV20r99s6uOW3
X-Gm-Gg: ASbGncu6zhuO5cU+U90GNxKLXe367bYSZBQyCg7Uwu1DMiNVXIE58sXZvSfk2ImnRqg
	Me6cdCciuaOEzDFiDSijC0FR+Q4HwWbCk/CvjwYH+fnla3hW8NAstQkN+RISgfmZ5vP1/jZMNk9
	XSq9I+ARaPHE5ldKuVxlWgtfKgqP0GLgPXHhXSSOAduDAvuufENzh6jC95EYVhmDzeR3kSELTlr
	jFZfZP1PPH19iywyk26MAs6qqkQ04+elh7g0Bb94kzBNMnN/gewmmqX9NNpX1tIUB+cHCrTgJid
	VInrVD5HnU7SsLdBRI2qe5FPOEh/g/yi+TROSpwvrLm0HY/wcLtgykP1pJ/b1hm3LBOy8zzOqOS
	Hxxo=
X-Google-Smtp-Source: AGHT+IFhl0ZD6Te4jksLApB9uC8vj5bATARcjgVkhtCEkuWPZe/GZXC+cxHuIeY6ryYtb9ba8vUOMw==
X-Received: by 2002:a05:6000:1ac5:b0:391:2f15:c1f4 with SMTP id ffacd0b85a97d-39ee276eba9mr240487f8f.55.1744737663780;
        Tue, 15 Apr 2025 10:21:03 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14987714f8f.16.2025.04.15.10.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:21:03 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/6] dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
Date: Tue, 15 Apr 2025 13:19:15 -0400
Message-Id: <20250415171919.5623-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Some DSP instances may have their access to certain peripherals
conditioned by a bus access controller such as the one from the
AIPSTZ bridge.

Add the optional 'access-controllers' property, which may be used
in such cases.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/dsp/fsl,dsp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
index b8693e4b4b0d..e610b7636a08 100644
--- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
@@ -91,6 +91,9 @@ properties:
       - const: runstall
       - const: softreset
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1

