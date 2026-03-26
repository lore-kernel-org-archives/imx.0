Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCC43F8804
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 14:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535855; cv=none; b=T6ffm1Jm2KMbRr+F+MgG29g9Lg+E1prbs5ij+H82ATopxXN2f41El27liDTegzLckr8HOVsPOd7mTo80/tadbnfhTRXfdVIAVFoZKEFvg5ComfffcErY+Lv6l2DUjsvVGi/7N2ITnoILZwL2h7Z1ognizw/Drs/u9y824k/nEMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535855; c=relaxed/simple;
	bh=donPfCs0ur2Q5LLhZqWFOOjs4/taF+94AtCN5851Hf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X0FSsvGY6iTvkLvsm3je5w80kOedg121QPqULgMwS3Q9InGDT4rlgEBd5RYf0PT5cTJ8Jhgje+NVu+CV41tBu9ZB6CfVdRJaXUaOjAf0ukRfc+tjgJQ+ada0CcDaHUJDloPOyMFpFHcARkFuTQVgLsYvOe6VgawBQ+WsiiVJfCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AzPavkLC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzPavkLC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso9541495e9.1
        for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535853; x=1775140653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSjYFvKsYHn3zLdzTw91PXDsC0yngduluZBblgzdeJE=;
        b=AzPavkLCKLX1XqQSobX78fvUAOA4h9N0uJsqec8wWKoXFUh+kQsghxw+o6L3Vz1eHt
         8o6B7H1aTIyzhmtBkGt5T/IjGDs4UbVlNS5bNDmujq1/CgFjOewDfYc7cm9TSymx86A5
         l9pT9KEDnssCOO/ROGGQ6G7ilGmkkLjVq4gNy4pRxN+ECx47BGGy6E+C3n9GJuwCTq5Z
         15GyPuk7v/fcgThR9KK1H0nKLbuRqzEVU+Sc3XZuc1cYl0SwFcytRDR8zDEuBrAIAJPY
         N/MXrkG+2BjLPTyoRX6/Am+Hpmj75CzDqt+iPR952BhBG7q1noGoMdUK3tuIbpkxWtwx
         2xXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535853; x=1775140653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSjYFvKsYHn3zLdzTw91PXDsC0yngduluZBblgzdeJE=;
        b=pr2/VQvKBVnQp0dz8X1Jjv3f/TUW94/g39CElGy8oE0nsgT5uWzU4Ggirz2Wk3S8Ai
         KvaVROCd6ApsoY7Rt2sjuKf84+fIEOtBh5cvsReV4ALTyaco4TQ5P3XdJoESjYQ5ppeA
         tDOQyLx6Dovi/ISGPd+mOYbR4I3jvAq5th9r09239hqJhIRg9pBmlpp0S4EeMVdhLvY/
         Ro9vMIEcqKb2P/9nR7t/8ID6phApQjy1jr/C3EeHlD81AXqb7Pm0VXcXni+chBUpBYzQ
         ASq5vEYMRt84FV1C2J3zjc5/HopS+VMR5O2hkSJXJ0zjxXDAJ1Zjn+4SWMAIkqglJk+v
         gTOA==
X-Forwarded-Encrypted: i=1; AJvYcCXrWAWeL0SUhuioVDq+j7ElbjCzyWqz7Kwqfj6nBeEPvRUZpjphLhMjT7AQvw6LbZgTCtE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbuIGkOdzuZRSfPSCdwQ0FgzbFXNuQ7VUH44RO8pN0xHXJnMMm
	lorOCo6ap3n2yY7ZTpJz761/qxf49tc4zMT9pjMAUuF6tXw34B+APQZA
X-Gm-Gg: ATEYQzyaEnpGW70im4Nm5CarCwlYCpIYaRMrMD3xfEVpHZV5HGSuiH/PbfHTb/WKbjp
	J9lH8nNxXznfHfTgvOGFRSraBzP3BlilsOx+6Q0WAA4gMMH0CX2ZAwqHJ+NeMBbkzwux6akgJOm
	ig/+xUTwEbDZj9Yrd0Dqqn5pVTNoIzmzoclwDVv6I8acqqJx4/jCvZpE61sNY50MjzBGo+/98V0
	Kk3d/ouInlqfxxzRZkLwBSJ3FOv4R+zQXmdLQYmDmkFDdLIymMt5q3bMLNCWRprJyciMWWOr7nX
	CS9MaPdJB7dmH+S4heSPRDPozpyz4z5GiqzjtYBF/Sojv51PCk5NpDJinkSvi+FNY3+sG6dP83e
	qs2ykVvBT55xGmUM2X9kQzE4ye6wgoZny1mjZ+rB0pbfRVBG7X4qKJIC6CiJI6Md1y90Bu2odqN
	UN2bY1GRrfkHL2njnGZKC/StxaXGdfvb9i4bxmi+8LkMOD5OxyXrytcj/y/iVORuiAK/T0B12sq
	1V/KuXU6GGnqBJUOAKoqaeT6OwnGNpnlAO5npzkHJgKtoojeH78hCfjuhqpBqUa5TcCH1AcJ/Dd
	QNxuVT3Pyu6AZw1DkNMd
X-Received: by 2002:a05:600c:c177:b0:487:2e8:69c5 with SMTP id 5b1f17b1804b1-48715fe2aa7mr115405295e9.15.1774535852495;
        Thu, 26 Mar 2026 07:37:32 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722cb5845sm34024185e9.15.2026.03.26.07.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:37:31 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>
Subject: [PATCH v2 0/3] arm64: dts: freescale: imx95-toradex-smarc: Add Bluetooth and SER2
Date: Thu, 26 Mar 2026 15:37:03 +0100
Message-ID: <20260326143711.143462-1-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Franz Schnyder <franz.schnyder@toradex.com>

This patch series adds support for missing interfaces on the Toradex 
SMARC i.MX95 SoM.

It adds:
- SER2 interface
- UART interface for Bluetooth
- WIFI_UART_EN as a gpio-hog to select the UART function by default,  
  as the MAYA-W260 UART signals are shared with the JTAG.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v2: Remove unused label for wifi-uart-en-hog node
    Add explanation to clarify the safe usage of the GPIO hog
---

Franz Schnyder (3):
  arm64: dts: freescale: imx95-toradex-smarc: Add SER2 interface
  arm64: dts: freescale: imx95-toradex-smarc: Enable bluetooth on
    lpuart5
  arm64: dts: freescale: imx95-toradex-smarc: Use gpio-hog for
    WIFI_UART_EN

 .../dts/freescale/imx95-toradex-smarc-dev.dts |  5 +++
 .../dts/freescale/imx95-toradex-smarc.dtsi    | 44 +++++++++++++++++++
 2 files changed, 49 insertions(+)

-- 
2.43.0

