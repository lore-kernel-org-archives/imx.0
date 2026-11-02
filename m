Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645721;
	b=yVsarhVNbUR9Q0kmlXO1Wnf4DduV5bYOJ9PxmZ+N9qx7ZuP0T1vdToEQ5Qw3oPDGQqx+
	 pmlV4QQb0e95N9IlZJxt108RkfybDiaGs4JnnqkxdNcxUXC2HKsDipqEoyXoXTF7fZLfi
	 /u5t1996BxSBh3a2CAKvQkWDScRO++55cSo6t0GfRxs3JIaTxPcH2JhJxHC4kUYgcF/xt
	 13JB3k3v5mBmjgJKaTnUOyMfrzVX2fcvZdlFWazdPsbmoef94m9PUsY9UjTatHNgPqbkb
	 3ZqaU5sE1L/VhDH3/DreLEliNG8+PGXLlDEdkSrNjAPTnY2IMqmgQguoJmmC8En1iGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OXL77zZ32z4nvR/569ppBfTKmHJlxwpJjlMvH+VK56Y=;
	b=PoLIxJcg/1jBB9ueQpAM2t795VpNB2QxxkOp61+WJjrHRHWT6XvA5ZUiN1m5mjh19SY0
	 AC4di9XkkesSu0PkoMYxyU/kNugGNRrzyLgof4jjsYlVBFTgpEz0ekCG+hPYYSBOHJeKU
	 XhUPDfOyf80nXiJksUwVVbM2eYYZ0SOR521fDI5/Lx9EzxxwzusDK6Emw3qmp9X5JIrc6
	 aEW6x8JDfggywScHDUN98tOHjI+8n+X3AL8ASWE1XyKEFbyuO9Kn4ORizvr8fCSYOmDl4
	 ZY3VshfDCklKD1wmhw7Rky086RtQAmb5yXMR/YRZWpH8QtnBJlKKC3HKTaFjaPQzObQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F2svQcJY;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EBE606A32D
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 18:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33EBE606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F2svQcJY
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e47347279so2080002f8f.1
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 10:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793645720; x=1794250520; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OXL77zZ32z4nvR/569ppBfTKmHJlxwpJjlMvH+VK56Y=;
        b=F2svQcJYva9zT9wnCfk9aV7o3+B3C1dJ+X9ZO1nrAaqHnxyQ4L14xXJcq3CnOHF9Vr
         m05uPqWERgcNANiSORrEPEEhl67nszEYTGhWhhDij8yrq17po7/pzUqHse5F9MW1i4BP
         D8rt0VaLQn+cApPj7m447pzItXXXKYoIZ0AnoEo9B0ndJLUngxk8QMWM55KmU1pCXmQw
         jlTKMjK64BcX+uxS+uhRiZSgY9UDTbZ/BcBkuvBgjvHG9DpLbVrj5BmQCdEHf04BUueO
         uuiXKkQq2q33mId2My9CeNwMEZOq5KxCH9ntIGt85MJ3p+rRWvcDnnRzegaxvp6dSr0U
         RO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793645720; x=1794250520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXL77zZ32z4nvR/569ppBfTKmHJlxwpJjlMvH+VK56Y=;
        b=MietbDS2HEebcsif6STvHxSy6ze/LkQdEKWdsSjtCUsjbalgQHrwsnLWZbXeqLpvjB
         44k4vlMxxuZzda0SuXxFeGjHjYWam8fOZPOpzCMSfQ7oh+3zDnCprJj7tYV9/7QrWZlW
         agzdFt1wP0a7iQtrpITxe1+LamuDCXw6Z8ZxLLt7OFR5Wocvm81eEtkcqQep3rZ206Fs
         EevXXTgI6HUYWwJo0AR5Tb9Lc1yaZm2JqG66QBmstf/gCi15XOXTEBSJDw12hFD9cxH4
         Pj8hdifl8a0d2qcPv1CCGoxigzwKyIqeOJR2q0aC/fH6alfSxb6DRiFk7ALVObhxojME
         YkWg==
X-Forwarded-Encrypted: i=1; AKwUvBxerjycE5BtZ3iF9n3C8qGqZKSCso2QLYRKbBIhucIH4bhxs73+NolDRgccWtwDYUTjeAI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Q2Z36KC+DnpXfdcsMcKFnwzk71ijS/M/G1Pnfy2LeQz2SkYcR
	bjvptvrWMRmcoKx0VYuGuPENn4WzzddZ2vOp0TJuIv1Q7GOKOgNt8BCm
X-Gm-Gg: AYBFou3en8ufFT0byj1goqsLXr8XWxv6uDI6MhhfkKN7w0el0UlPxDNUe1m2tk7Ui1o
	Nn+3KLsEPMag3ljx/7ue6KoNOb/4bylFXsBxnwW9G6VdXLwr729YG3nEwgBK0lQYvm4RsPYn1ae
	zhqM4PbUJ9H50KLQLFN/mj13FMQQ/lloY2V9ho+P+xeNrPED0uqkQONMRJxsVXjkeN/9MgLGDWE
	rLeefqoiH7yfo5BLRa/MIc8FjQOwDLltScp4aeOEJEbW2VV1Yy5szj9OcqHT1PanfDGXOXhfzso
	4+uSHcvB+m4Y5yO39SACr0tcmVaI4YsQ4rEPgWGKvzAkfsHh51Y/VK7JBUP6F0JxQq/puwT1/VT
	R/CYiFZS540rr3CDjOtxitUwax2lgfibjMEL3mIwnpjiMPKhMXYLlp5qe3W8oLZJcauVzePjODA
	KRX1hsKprAKRjnOa9Xplu5h6ZmYGuzMweO8MncWVLQkg8TW8p9Ynzf9MlpJs2r4DDm1iEix8phM
	/4Xf2l/K0wlFl3S8eO0eZlu8Pyk0tdtQ/u+pWictCtRY9zXnM7mGtWNFXZAmrb4Te0WNzLn3XoL
	FfJ88k49h5fU6v8mePGLixBS8o7Ujh2b+9bsKmoe/9DEGoTJVfLMcJpmkrFiPeh4N+U8JRk/+Jv
	+T59ViwH2++thF3ht+WjkzYhQ7NXx/iNs3r4mkSosV6aDnFwX15MqQC0bI5Kme9jlQ+Tim7l2eA
	==
X-Received: by 2002:a05:6000:4021:b0:48d:e6f6:21cf with SMTP id ffacd0b85a97d-48e6e306900mr25328622f8f.31.1793645719465;
        Mon, 02 Nov 2026 10:55:19 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm21965403f8f.22.2026.11.02.10.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:55:17 -0800 (PST)
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
Subject: [PATCH v1 0/2] arm64: dts: imx93: enable UART wakeup on Variscite boards
Date: Mon,  2 Nov 2026 19:55:02 +0100
Message-ID: <cover.1793645417.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series marks the LPUART1 serial console as a wakeup source on the
Variscite DART-MX93 with the Sonata carrier board and VAR-SOM-MX93 with
the Symphony carrier board, allowing console input to wake the system
from suspend.

Stefano Radaelli (2):
  arm64: dts: imx93-var-dart-sonata: enable UART wakeup
  arm64: dts: imx93-var-som-symphony: enable UART wakeup

 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts  | 1 +
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 1 +
 2 files changed, 2 insertions(+)


base-commit: e20daa6eb46fdb339be122a37211aa408488a3e3
-- 
2.47.3

