Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A1F302779
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 15:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769615738; cv=none; b=hNFygAKlKW52MHBckYbo16uaoVtD01foOAtVkkJMml+BcF3CblaNRzIFjGYAHFyU7lUcHA6yQx90wsMfqRFKMOmHdpSm9v1DsiiiJL21mg54JE+JcQ1d/0ubcw8teZ+WDsE3XpBGdxhmy2Ldy7IU+XfTm8FNrHft4w4Ll8+EuTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769615738; c=relaxed/simple;
	bh=JiYGTuHq2oLea1U9eF36mE1SQsl/jFbB+f/XpeC+SjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lRvhyVoZB0b/hhc7B7AlJMfRBapCYsiKqs7cromHt44222aCEhLFzoLw7dJ/jgnW25LLJ+1q2VOS9Iy7AyjAiaPH2lKhVCLcj0dXh3oUfBTZll1mLKrs9Dg49bNlpBwvUe3fkWvLyw1YQP2JRagVxms+Ysk2b3XJRPCUXuuFXXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUFnQeLM; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUFnQeLM"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-34c708702dfso3929120a91.1
        for <imx@lists.linux.dev>; Wed, 28 Jan 2026 07:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769615736; x=1770220536; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvMGMjr+cGrxf3kN3/yzoufMe/etzQ/b/TcpkTkqcfA=;
        b=RUFnQeLM86FAIjLFDvmYlw9OfvTujSWQ+IQB+MBKi1jhkleRbiKXszAeKrERg6ypHR
         UIR66e6uRVPvVZUfIqrr8T9WgMGGQ3KW7GduAXEFW8ih9rnGu2XbJK8NNldOY4AN3VrK
         s1YZDavR3Q/nnlqCjoIRZiy9MJd2S1TQJuPn3VDy2E19FZDhRDXRSPmA7SIKMRSW0f47
         DEZVwJP4Fn9J0NiALD2YT1L9B3yeXytwtqj+8IrRSN/CuQyA66Evksw7EZoSPA45t8u1
         v/NCpeNGp8Psaf0Jhxw2NtvlQrmLrArCQcRj3TZvmU9A7D9gXejVe3Ttsq0oRf3PGlGO
         cRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769615736; x=1770220536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GvMGMjr+cGrxf3kN3/yzoufMe/etzQ/b/TcpkTkqcfA=;
        b=tsWBMMqB0ENBiqoWrQplQSs2Vb2cwF6MGxVUY10V3/V4sKeiWjDVN8/f/BcrYjISIw
         DYoa/dvxcUis5dLuNQ0wsD8cLrjLF2QmHv3FJqfNEq+WprlXI7qehr+Acev1qBbJ+zo6
         wLXjjyUWJUpV3/LPN7S+R0LuzPJaKGB4oTYMhApOru8s9flgJQyiSznX+BCFx0acbb+m
         CCzv/pbhsq04Wr0A3zWdCF3tUVVDsq/COrrkkAOqGQGU2ef+R4yXVndXwJ/+TSJRYXs+
         M5uBpOnwXXsjGNW9B/FBFd4Sx03kQv01+fOHsAs7dMUDsXu47ruv0dHOgT5tcfcbo5zd
         4IYw==
X-Forwarded-Encrypted: i=1; AJvYcCW5Jt7kUz7OM6H8jmbSA7+KHJNOq0VRKmclDLVIS+bCmFljPAmyW1k57ROxtA+Xz7EOUUM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7hbsz3efCWy15zs+kBD/0tZBlUuoEp0ohwhSV7uBCf9xsmM6D
	iQIiDF5mFFAKqSzL3Fpn6FrL+K5a5jP5IBld67R2gSJEqrofVptx8w8Q
X-Gm-Gg: AZuq6aIcckn4jTfT+TkqvX6XCuer3ffKGJufiU6jEW4vebKQsR1PMsUY8s8G5Fz0kYG
	O50sCjA9nGKUE/yqZ694VdglvDyqzgPluppX77UiuK6tHffTUFXClAHEAb6/3e1SiX0w5R/YM41
	ldD08gQRhg1c39OFSPTUYLo9oF1zbi8xsule9ur5Pcvf7jUMM5Oeg8ET4E7lMbMZpHANcTKI0kC
	aDs5lx80KhnIRL7Dw5FdxxpUBOqq7REvB536eMfNiao8aQ1dc1B7zeNTBE8VgUgf2/vEt4aIPtH
	+r5rFm/JgIhzzcciAhV/gMgk1SbWCD2TEcvdTN0v1A9VRU2bKIo651Nqao0M4BMbPbvGmfQ/o3a
	R4Kp2Wo5JBrE4TU0Jtc9V/RBRtGOZgq0D4diTnJTyY3/OhzkUnQfKWgm/DdaI9L6oknkBs65f4X
	OgcWE5PPN0dr2gO8wh6KSAp/Yb6qIL4+1DHwyMhDfHdAoReU4CFg78Ve4=
X-Received: by 2002:a17:90a:f946:b0:353:f7b:6d60 with SMTP id 98e67ed59e1d1-353feda10admr5504546a91.33.1769615736352;
        Wed, 28 Jan 2026 07:55:36 -0800 (PST)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6427da845csm2621521a12.12.2026.01.28.07.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 07:55:35 -0800 (PST)
From: Wig Cheng <onlywig@gmail.com>
To: shawnguo@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zaq14760@gmail.com,
	Wig Cheng <onlywig@gmail.com>
Subject: [PATCH v3 0/1] arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM
Date: Wed, 28 Jan 2026 23:55:28 +0800
Message-ID: <20260128155529.3699599-1-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260127025740.2601841-1-onlywig@gmail.com>
References: <20260127025740.2601841-1-onlywig@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v3:
- Misunderstood reviewer's feedback in v1, improved commit message description

Changes in v2:
- Fix Makefile alphabetical ordering
- Move vendor property before status in device tree
- Simplify commit message as suggested by reviewer

Wig Cheng (1):
  arm64: dts: freescale: add pixpaper display overlay for i.MX93 FRDM

 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 51 +++++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso

-- 
2.43.0

