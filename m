Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979115A512F
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657758; cv=none; b=gdCtolK7P/RDuKs0uW/DI/mapJagHDmoPEGzDttQk0auMAIJxPt1xnoEi2vSO7+TsCKBeoOvMflLGM3H/7TxH1HPNwCs+XP8oFmKm/bRX6DiSo7bhoBh1yI4/ryBDL+Lht6Qjv11tekE+C8OyGQMoz6B7bWB6ZoWgk1WEfgYkg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657758; c=relaxed/simple;
	bh=MsImb+1536QAHQzSwaHjm6KM9sDbSoEHlPqn31ZATNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rovLTYLidE5LOZFK8IqLswCE9RbzM/YL06d3H9Y6gwvFZB39YjH2alKFsCIweOKn0bK8iloTO0g+DZJHg7pD1wCxhsZrtawDltzJlFnKIdZ5taeas+2oz/9RtLcJvkiYB4U1cViMYSRduuhZtCY0nmKS4VPSdz9cZp7Kc+FpMBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAlUup2F; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAlUup2F"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874fso357855f8f.0
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 08:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657738; x=1790262538; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mq40chmiQYOJ0gNp2bpIfeyZ0OR86JtTGyJZDUn+cjk=;
        b=UAlUup2FGnd/bG4S4A7nPUy87Zoj/oNxaMNxjYjO+J5aHihnpz7mIUvDxSAj9ZK7yB
         G3XyXcUxZnsRTCEgho0RyG0T4HiBJIU3OGxhy/EItF3cuDiNjRQ/sAHsfdpcts60tJxM
         nrJBj2isFZIQcH2AsqT1huPxX7vA/vwNYvopLiZDDipDYrMqiXntULhi70og+Pzpd3o4
         /JRIIxiwVzwxnq4f/y8Rf4aH5pmrl77GAZmMS5JSrl0IACV40OimQ6YlGZy/c3yKuAME
         T8AmsngahosFIT6VQklLhScZKaBqk7GbOBG7s4Cgbc+pWmVJ4reBmHc+gB5bCz7Twnp3
         cOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657738; x=1790262538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mq40chmiQYOJ0gNp2bpIfeyZ0OR86JtTGyJZDUn+cjk=;
        b=v/XHT2m6IvG6/oySDoBqUS1YVTVLETQZDuYnMbg0x61DnBBOzArew6F5C4gCpRCnMn
         a8PbcKji7qThnliCXvrQR/PuER9k23Gr+Dat14c54GD1zhrfG/kZXrmLzZEngKMz89rG
         Sp8RNB8HUREf1fOponLuQLIhuChwrDRQ7Tcjpz+Fl8ZgXoKl/sIWuv49VDp2epXbPvQu
         4uumwQGF7ehYHq3eEaHHlNMhwjRrJZPCaKgs7+QECU8RKO1g5r1a1tgmRgeQgm7BnJua
         MxishAJqhh5bDsGNf7Kj2rEqj3ZRUSLR+jJyCNKh0EksQTeVpyBVI6S/7Us4/dQNmCQE
         d48A==
X-Forwarded-Encrypted: i=1; AKwUvBzJF5ronYtYu34ENeZ5j+y3t2HR0pD1RQi5tjGBuu/12fgaY11yF2SMYSUl/QJD+/QxKcY=@lists.linux.dev
X-Gm-Message-State: AFuF++loUYP+C1sbtDxrU23q+f0Ef2mY2GFAYPKpyqA0PG4hnaPMRFO1
	0xmh+Mo6+FuX9CYCnVBzcXVvD+lqIYMJuEt86k1iq/n8NzL0qhxYSdDE
X-Gm-Gg: AYBFou0kR1vjNLSxQOxNWIKiczoTxGGU0dgBtJLh6H8H1cAOFql1w5edorCHqzNJNw0
	CRs8GPsnPrg7egbpNJhVPHk70OuMhpJqqOia397g54DjbDHP35yjC3pG413SbmwJjU8OuQdQksS
	50so1c+JPnDuhbt6/eDN+cuTl8x1coLwKzcuTrlmTvRNlk09E/y80j/X4CKObR1OzLnAEeR+ZoE
	1msEDUz6EFao0adVObh7h5V71FqAOPqx9bBjIv6cMZ84np+dhctMKNgD1yBT1cFg2oSFUT2GtGI
	6K8z7tnR3SFJ8aj2MIiFAF230EBBzw/y/ofCK5Ktx7P106OnmYkQrewJYSXio5l3liJvN0BnBTB
	9od8D+ggI16YZFfscDjEk3kaNaN9h80dYMtkEyKdjCEFoQ4SWTGNW98FCaOn8hc1rnZM8uknKJC
	1E88itk/3eV64wVNHZCu+E0CiQ7+ZXfY1IzXw/93SIU+ohRcI8c1tqP+wK5No0ICMCinfSJ3Y0u
	kYHPlYW4WTziaYt9qglHu+YrFmykHyTpX0e63DviwKSi6rg7UHgYfMLPECin4gd78IJ4W52OyVk
	jyrecHWLFSRvzr+7nzaigQ==
X-Received: by 2002:a05:600c:1992:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fbd1af43dmr50366195e9.3.1789657738046;
        Thu, 17 Sep 2026 08:08:58 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm82531345e9.1.2026.09.17.08.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:08:57 -0700 (PDT)
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
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/3] arm64: dts: imx8mm-var-dart: update SoM support
Date: Thu, 17 Sep 2026 17:08:42 +0200
Message-ID: <cover.1789657399.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the Variscite DART-MX8M-MINI SoM device tree to
better reflect the currently supported hardware configuration.

The changes configure SAI3 in synchronous RX mode, add TPM support,
and increase the Ethernet PHY reset deassert delay to improve PHY
detection reliability.

Stefano Radaelli (3):
  arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
  arm64: dts: imx8mm-var-dart: add TPM support
  arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)


base-commit: 46d8fa682d263271f3ef7bf95166b124c19d6c62
-- 
2.47.3

