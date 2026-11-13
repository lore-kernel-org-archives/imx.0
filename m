Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567920;
	b=H9AJxBUxaVDVe35NpHHNCNZpsl0urfqmfI7IFakHrmW5ggRJt5ag4h8WIZGzG1MfZDs1
	 GqiCnGZS1Vd7SuZvkZ5lxejlYmqz22hUc0tZHHVUyBrtqLPoUwWLERpWpaOSadsuifiSN
	 9YsoklEsFzA+t603kQhr2+wpANWxHZKP833yUO7feW+G2e8Lmb+5jjZXgOvgt6hwAsotO
	 gTdWHV+gxIHOBtF7Wr2QSEZT5G91OyVPQWh0MEjUw61QQD/xf0nqzupNzmWafrwd2/bfY
	 sYB3Yvfvvk8sq8saJ82CrUjFcdC3inSC+B7jxHy4ZBYBw/NrnI/Gqbf2MFXfXsptNGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QftI3K44ZZiobTwr/u+4ZTOlGFkxNtcO4iEVZ0vgnek=;
	b=Z6+x1EBi83nKGNSgCyF3EoYSG6QSvarcy0AEV/mJ+VnnDiYX6f9kf7D3Te0Ws2zpdBj1
	 7RUGZt3yVHw5x8R3LCnCzqiu2cSrLbLpYKI1Ci9s/nt1DWO8ZVHCyJB3sxC046Z1GGJL+
	 Yv5jqjof1R1a59AuVVemQWnwZOJzKyexH66XIBlp1lyXGmDang77DBHIzapVcF11U6tap
	 tpj9luLWqFOZgsKxKHlRs708qR8cRtEovGw/lq1TUlvprUbhm+LACRN+H6FaItHFHH+r2
	 la01dbWGuPZKNH1vBuEclHycdc+UeVpLG4+R89wDVx0GYA7s6eYriwpWmoBVTigBeQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QGhqadxb;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BEA606A333
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 11:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30BEA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QGhqadxb
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so10804985e9.1
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 03:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567918; x=1795172718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QftI3K44ZZiobTwr/u+4ZTOlGFkxNtcO4iEVZ0vgnek=;
        b=QGhqadxbFWCD/NvYPyT+uMPUes01xXvHVcw+w4Fxm2VUCo0H/CU2WaFUEdjw52NS7I
         PwWwWE19MFqzLEz6hbRG5pN52srMW7fDUz1vG2tE8hn/ad9rQPhiaJzMTE7aD+mb/zrA
         NTbB7pEDah8N/z/b4CwIc/RtmyGqhDY/MPpBSEESxBTQmwCRklGoii9DF9gE0WoKm3WR
         VOPGX3XZ4Efzu7T3D0UNaOyS1AG7Kw30ngWDqjYYRNPGzzv+bzrCYppal2TUI2QxKaNM
         7/dMubOmYiSvH0r4OXf49e2qhoMHKJ17fgcBNNK4u1xb+W57Cbz2rfltKvwK/89FoSyL
         2E8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567918; x=1795172718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QftI3K44ZZiobTwr/u+4ZTOlGFkxNtcO4iEVZ0vgnek=;
        b=O+t6fJ4I2ftvIFrnFM92UB3gK6yd5s5Xup04eovas0qLXiVfoBqZ2rAJr6CVQbYmcA
         dhMpt/i4cI9Mfe5ZK062qNLS2uwstV5iI5z3O2a6lmw3V26zw89tFpg6WeTZwFnbttaB
         3J9BnGw6SxuCh/m//cvrZ/faF5YLv3VoMaaMOAReIB6hxBRhFi6Fuqh2qzMkpkwDgi7R
         DclY24H2bd0/B1wRBE+Pj56VAtXNNiS9UEdECFveLipcB6wviDM71YPE5t8YuQJiVACY
         ecOIeQpv3/N3QmuHIk70IuyjvG8e9K0/dRGOs6g7hg1xhGFW+Eto0ipOJOxvn73ehjX5
         p0fA==
X-Forwarded-Encrypted: i=1; AL+hErF7Tdg8Dvwnlc3c+34oJWc17yZMevN4ML3Ieip9zVr0JMx5K9shh0JauES1q437fb9PsdA=@lists.linux.dev
X-Gm-Message-State: APuU4Z9zymEHS8ZxLIbHbz9U3zFFAetIuPZV8KKFp7Yp5cqTQ2w1DmiM
	WZVA592FtDvie4UC+2vvlUlv21rAqobXllj/niseFs+Ei/ix+YuVducB
X-Gm-Gg: AYBFou0hVbg5oPguLkgc9j++4nVBC/RctewGY/rI0nFryhgb5iRFoUt+llKj2BsU6bc
	IDmC58xZ9CHsPARM+1Z9ydjm7vt2a1hLn5UjVcHOJ+TTZhIDian3To104o0CMup+dBcVh4l0Mgk
	HAYTo0QHKf/oMzu+X8U1Ytv3DbnfJhbae7tRpQCVdNoZ5xwd5+rY5pMMagH+CVBgNofsrB9CKW0
	S4LZ70fTlxG6gHxJc0UrinHwfvKtWHpkXsXW5S0XFR+Gj/ul4kNi8TYc18t1B7cG4FmyfIYMNwf
	2k2/ozCFBMw2uwJ983BbwE02D0TCd+iYBraoe1g9GAKYiVmzuXy8d6if44HmRPbbt37vYr+n2d/
	jhqSeQWYauug5nVDoipGGB2OmF/MEXlcm7bVHwkRTcc+O9Jgk9Dkbpe4810Mfmr7V+GCCakx9m2
	ouH9Aoz7Av3/oswuU8VYtis8TMB6mVK4GtLEqJ9eZZIzMsKWgIbKMJ6GFXrmxuqjY+Q/XdOtjrA
	TUDnChHJd9sHmssPgYexltdFWnXAJWL0vTj9VtpaaCc4X3GA38cJ7lAmeXF+XmSqh2hSoOc/zmg
	B4Gi8vnccrxsoPOZf9cnsarmJ3iuGabutME=
X-Received: by 2002:a05:600c:3b16:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb55a6116bmr46200125e9.4.1794567918385;
        Fri, 13 Nov 2026 03:05:18 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e4a2asm4788105f8f.39.2026.11.13.03.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:17 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: imx: return -ENXIO at once when a DMA write is not acknowledged
Date: Fri, 13 Nov 2026 12:05:16 +0100
Message-ID: <20261113110517.1142293-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113073250.1037215-3-mehmet.fide@gmail.com>
References: 
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

Please do not apply this patch as it is. Sashiko is right on both
points: the new -ENXIO path leaves the DMA buffer mapped, as the timeout
path does today, and a NACK of the last byte the DMA writes can be
missed. v2 fixes both. Patch 1/2 is not affected.

The block_data remark on patch 1/2 is a separate bug; I have sent a
patch for it on its own.
