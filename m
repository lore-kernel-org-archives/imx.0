Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB90C36D4EC
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771354788; cv=pass; b=pUmcdQ2VgHEkIiHt5iIpkCLRqqCIjpTtE38LrBnscSX6Klc/OCpQG8wvtXgoHi50vLdY7TCvZ9wMghnTYnJY1BYUWEC/gRVygBaWI5+PqckBwDiG81QUlwBokcPrzIlQzZMF3tdD4sxGh4laCpcfnwnI0btkfKIeCIEywcC80js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771354788; c=relaxed/simple;
	bh=fZT+8vawoPT8uZ2wOTC8GV0ryB6Ko27GMVz05oIEvQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IxaEP3rFis+Nf1jvWv3CmQSJMaV3Jn/fuSANG56jr3QmCQka/Dj/ar+TG3WQVBPzatfnYZkrhQnA7v2Uyk/8Z51bOmvSWlHaGkYus3DrtD4sOmVfYmV5CqGDysZF6NIsK8jLs0b88DTCIqhYSTedPAyPor79TtI6tX4NyjbP/1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHA34/v5; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHA34/v5"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59e62a3ee29so4575039e87.3
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:59:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771354785; cv=none;
        d=google.com; s=arc-20240605;
        b=Ae4G/RIKdLBvUZ7vY5Gqn8Xlxtsz8+QOn31uNGdlfnJ2LtgEoTKsl31uBXmlZ/Ry5x
         izGwVStea+GyDgCwrpx0JceO91AxVGF2jjrV8oFtYgL9Qs0apD+Au4yNEW5PEYf/hcof
         55IOut9bJ5RMiAFqs1JGoQaOz+zH94s4hS/ebMxvR+thevAJ33zt3EhSvFxTB0Bscs9/
         lXQ3QvkyS8KTCM0XpfUUYrp31XKkP4zajJdjRH03OPjPww1ksxQVafVuoR95VeC31xsr
         FcOqIrkG6J0I99T6V6DUc3zJ7l81spfQpIgblQF6OkAk/Ayq6dJeW9JphRW3wbaSUGqF
         wRyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mf3CG8FpBVExOnebLE9bo9sjz6BKKY0o99u+hV5WSwI=;
        fh=qm7sh2mJdL1uQ6YP0BkYFmfkYtiyfWELw48eZTjY7b4=;
        b=J4XaQwMLccr/KLrMBgdJs/Pd/cZVxaPaS7G5uk6NYoIllHnG8Fl9PDV9z04duxGe8z
         ZjwVweu6DvDAUrC97H3bSjkRI15wOCngnjj9r0zsqIq7xnWukPDTujfbwFweMUlFlEVu
         hKGA/Y1Nq/QUDice8F0MnIb+Hwz1XyOpYtJIvhOQ8HRs+F38pBIWW7uuODMY08XOD3+e
         rrEIdAL5yrk1ZPGikv0LAJKdoBC0DIN4d6dwR8EkZrr3BN/HLf6110d/xQQvTtdhM5B9
         ZiWta7h4isLQnMB4k3hzF3Vx5dMhjkW3oUGNE2aCwQSl37AC6W4Vj1LX58usez0c7b91
         gbAw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771354785; x=1771959585; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mf3CG8FpBVExOnebLE9bo9sjz6BKKY0o99u+hV5WSwI=;
        b=NHA34/v5vaXwNc8gCxJTKQJlF6A7dqXkGxzre/3CbX203yNrMlGvczm76SivyPgx2A
         NBifKndB9qdixqyIZSiQ4kxd8zi6kNStm+I7j9dxo7YQ7G9k9ZHfpkNtikzVnaxkLoW0
         eq7Gvysv5MtVOOBV+GN50xEdne6Tpz9isG3QUC5PNBg25Y+nMANDJyj6p3rKZOjDOf9y
         kJV01a9DMj/kXRfHnO3XOn+5FNNmcK8P7WNedSXaeQMWWD8srO7pscXH3iQeoB5IcC8v
         Jp4w0ntPYZu04xHj9cpurB9HKz0qzr/gDHMaYyK8JnXEk0GGIUYzR9MbbmmNLnIG+mNc
         kiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771354785; x=1771959585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mf3CG8FpBVExOnebLE9bo9sjz6BKKY0o99u+hV5WSwI=;
        b=kjmUaLkivxxErfqAXkeFF9wkcMNEa3cTUw2ZZ6iGkwOPhTNgvRTdeHsmOTkZ+Tc55i
         he8cAMatr5IdyTvPX/W9Qq0FiBZxGD01xzBj94kSAMrCl4o0sfNytObC4CcWAnWcLsNV
         vE3fuPXs0bQ31j+yvyRZAtx+G4PGqpdhcEa2vzBt8KcIg6XnD/yNyMWJ15QgLFsLiY8F
         7ZuVwID4yFJdTd+xXPnBgHM3HizIDJR7mmeDjMlh3SnXX3BHyp7KEFH25N/3j6NmVWqN
         v6NFTLMY2cgwekSwfVEDehR/mt3waLqjEoYiu3t0/s9EqLiDYjSwsLPulEbNwfohXYAk
         0pYw==
X-Forwarded-Encrypted: i=1; AJvYcCX43A9pTSteNnJh6NZoYgU4IrOxWGkHYCeC93R7N4W3SRlWdC11Nc2vv2ArHSUG3ifu6AU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoOVSCW7Pp2BLx2xLvE18Mxy99VNrciXrOvWm7AYM4w8+sIWde
	/VnWjblcwBhmsm/7AgytN3Or64M5GmvgojO0awvbLXXWCldDGDS54UXUXIcAaWFmEriFuckWRan
	KAS9br0SOKyfbwRc3o3PTD6gy46/Tji4=
X-Gm-Gg: AZuq6aJzFwRFqdrcbDn1TPHO2DGlP/trwTby7eL+WASz83CjnqGeUCnD7zA7HZN5+Gl
	yedE7N4cpRpntNa+E4TK5oi/kCztOwboqvP7+RQuyqBdoA3JRFz3IrwnwCxk9bu0RgCGZ/eIPBo
	i2ccXy93wrugaX+ab32PReKnabpnqMLTWGp2WfjVEAILMW3PcA7SV+YnibRJWlY1baw0kKwgI7B
	5WJ7CQWIi5TDOb5+//jQhGrne9bFGAY5JGFiLuLlo4G7xn/PuWnkn0FY71zQ5G/5us4TlMaIGtr
	zumP1XKB11xIy2zcNhO0NiOJ+Zz5It41qHAim5SBPTiGcj4oOWMtnMN6RWz4lPGWQ4QXnag=
X-Received: by 2002:a05:6512:31c1:b0:59e:478:6423 with SMTP id
 2adb3069b0e04-59ef97ff31emr4493222e87.21.1771354784796; Tue, 17 Feb 2026
 10:59:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1771353301.git.stefano.r@variscite.com> <3e79c4d806b8b8024b71bc99c36b09a2fbb90a65.1771353301.git.stefano.r@variscite.com>
In-Reply-To: <3e79c4d806b8b8024b71bc99c36b09a2fbb90a65.1771353301.git.stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 17 Feb 2026 15:59:33 -0300
X-Gm-Features: AaiRm52kMzrAsjUxh-2JQc8fxA8DgYgxlgW7re9ZloT7Pc8JEqOscwExFoMYpIE
Message-ID: <CAOMZO5CAb8738HdH49WcY-JPTzQ90n4Bnmyn96_3jfw47mxOug@mail.gmail.com>
Subject: Re: [PATCH v1 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT configuration
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

On Tue, Feb 17, 2026 at 3:43=E2=80=AFPM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:
>
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Update the WiFi and Bluetooth configuration on the i.MX8MM VAR-SOM
> to match the latest SOM hardware revision.
>
> The SOM now integrates an NXP IW61x wireless module. WiFi is connected
> via SDIO and Bluetooth via UART.
>
> This patch:
> - Adds an mmc-pwrseq node to handle module reset and power sequencing.
> - Updates the USDHC1 node to use the new power sequence and required
>   pinctrl configuration.
> - Adds the Bluetooth child node under UART2.
> - Removes the legacy Broadcom WiFi device node.

What about users who still have boards with the Broadcom Wi-Fi chip?

Will Wifi on the old boards stop working?
