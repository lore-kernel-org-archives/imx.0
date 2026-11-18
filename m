Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795036962;
	b=wpDNG9/C2yI9Nt2AHRDzdUnBxBxIqBKLIDrTkna2tHfdpzC/7eNDo8fkk9VlTIjziKQk
	 emA3mf9yH69q9Cd6fT5pboTfUHFvQWbJ3Q70In07iN8AVlg9CoY4rVRuvhzqDHQpfDfhn
	 iHH8LtEYQ/swng2UygWPTTdEElZu6apHgfNr1b7FIcT+/iVwWSsmKGNPHwi386jDwDFY+
	 n4rlMHmlH/V4oXifNiJ5Eh/3ToiCEKQvb12XLIX+niD0i99jmn0q+zBPoU4UZgARh26Uf
	 0z+kb+7siigc9jVT/2blC4hZBoXYk4Z7Nh72Ic8dM9qWOGwYtYkkfYb3PaMwCIHRRjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795036962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=77XdCFnBpPZUcglChSxtYPfey28T7un7NOTqJBqY+Ew=;
	b=3CWmVOejTOyiednshDEbi9vFTisqM0QWbKXb011oruePrEVCtgNSdYriVGMRJW/A7rM7
	 SDM06O5A0IHX5YKgF5s0Pkj1/5dmjs7c+lbkvWuKMP4qHptF+XYyKn3HvWB+TLMQC/Fkp
	 hA3Aw4sv0xT3GUvo8/eipCPiW2f1wFLlmy8asN582CZTFeu83xiFV+S6UUxmbCAHc+tPN
	 D/QX6xlnRuT3heNyawTAZQg00K9UxbLO9yMjnlI5kezGpggNkP2ztG0bUVPSHNbimg664
	 pdqs+NaGTPdxfwN2mBH0X+6l4QxwuTyyfRVpmeuKt3IQJjPo6Q4pON+ZIxlrV11dWGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESGbNWhh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE925606A325
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 21:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE925606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ESGbNWhh
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3acff56a300so16677471fa.2
        for <imx@lists.linux.dev>; Wed, 18 Nov 2026 13:22:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795036960; cv=none;
        d=google.com; s=arc-20260327;
        b=Mvqtv8JJChJUojR0VrS5Q/Hem6vjjLZ6KVcUJxbtQIcuMpBILRCmeWz1jGcYisdivd
         JFwvuJZptYF1O6hhynLnldOjEWIwQ8lvUSNAKo0yclIITUFVv5w9vVDCzrDvqJw7MrpO
         YUxh2FB7bbACUlhjWcmaUzr4KJ1vHeKA1Q0HUcJxsfoPCixfgBcvaxiDfsxCLkdV1CXh
         uOniCer22cU9ce4wDAtUjY3CyJoXw0EKktMxDOMDt4DjAtDZRj1k3fdB1tO5cvOKHPuK
         bBuoVvKIdIURJFgQVmJeOYtey3VxvclWYih9Me+MP1Xc7DAngCVexl6GOfNEmHpZ1B2C
         FHgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=77XdCFnBpPZUcglChSxtYPfey28T7un7NOTqJBqY+Ew=;
        fh=JtdZvmmUfdiaImhkb+2VR2r5v6DbFm54Lb+UJYqP5JY=;
        b=MW4ihP3tCSU/OaR6rs0SzLA2rMt3dXvZ+aM81W1Y2hTxIOoirbxJYQ3dvmSQv5dn1Z
         C9y5BC1CosINQmFtE9gkiRMQlRLXg7S4hj9WzGjxMj7IKJV8AZn9gFzCvSEMVyqJK9kU
         ClZKvjZ3Z2OVF1PPk2pP5PStsTPrMumri+02oC7GYqeCGUWT+il4IsR3YYYlMQhewaGA
         zUFSR3Lz6BN6eptlGLKAkIYjx0IPj97/ncaR5ZwR11IoUTfJMvHFxSk+Xety+PsaT6Uw
         S9/+gT8SSekcE27jqYNQDH5XnEWM3WWw+ZLwwgCe7l89GvgOsoaL3PNpnb7UftUr3n7D
         Bo9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795036960; x=1795641760; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=77XdCFnBpPZUcglChSxtYPfey28T7un7NOTqJBqY+Ew=;
        b=ESGbNWhh2gcOozdl6t0vDoJTWUlXjYL930TQsQAoy03qZfrLFYS2GoSY1PIqy9Rz9n
         SW0YlfguCh0lW+QUre/8+BpP3Kc7OxldAW8XMaXalavVSUO0rwlk+/EGgovNnxAh0fbP
         2Xq+BIkXzGMShQmFS6yZY7H/IVGtsRjO1VR7RhWOlImtsjZhKqtS1ddMHfBPmx5i/PXq
         B8sjVzfvk3NPvb9VpJwOgeiNoes0qlCdXPlXNfbp/byxKorVyQurmQvgagliYpByGwNY
         Gd+A/Uv89vm5UwBxHXWyKwob4jmXbiU3KKX2AL0qgXWGLWqh0FRQ0Z0c+/AoTF8khK2n
         xPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036960; x=1795641760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77XdCFnBpPZUcglChSxtYPfey28T7un7NOTqJBqY+Ew=;
        b=WRL7k/7uHLeRKwUWvIHmKNBywEfbz/MMc5eN0ucO84fNuOley+MV8P8Uq5JnUXD7Lh
         YTrINON3iVu1yxuWpX26OSa8Hr2qeH6NHj7+F9PYnF8Dvak5EYO49pEB/uVaHkF9Ns6S
         V1yw+ABiWOcWiouPsiUU9iRY2/Cghzb3ImbceXgHopBVrbfrri7Q97basAf5B5Sf8R3N
         792fcWF6klNJ/56LSNFx3HLSCYqbHBW/4/3ASCpJSSYEHRYnSMdF1RxLPRW46NkYXI77
         7wRVAST9WtKwdSMSI5QeeUdaPLts1q/WRnnWRY8OWXVRmSiXvvyynMn8nsYDH75F67/H
         3Slw==
X-Forwarded-Encrypted: i=1; AL+hErGo6dEhm+UwQ3vyEq4mw35OiheJP7hH1UwRb7HDdnuklberU7OnBegl5UonAIK44ADi9co=@lists.linux.dev
X-Gm-Message-State: APuU4Z9MCDxUGwJdDhx/E/k/paACeq+/KFyP6E+TkdDB5pEWPnOR6JfA
	dgIq2zVPEYkQa4HU+ycmzkyNEX5ioH9h3gl/hcM7RSb1tTZe9KJ156OajeiUYcevJ3kqTluGetT
	HxDCeH7eoZAtcRV5mD3eleCa1cSs08GM=
X-Gm-Gg: AYBFou1j2jVEOFKa0f/OnR85bX6ykPpwdXmG0tKbr4zG1UjEcBFUSP8/bjw1okFpF3f
	0H1ge5APPCydXW6qZzplKMDtOOAbejENaDhXwVPTbM2xfGE3p2cU5WYCtac5+Xkchfk+qurq05j
	rXL7PDpiV9iGBWhmqfTitz+4fg+4RaIZaZRYeQpiPOj1BFoCPQdQTBu5gtrHpnXyjwM6mvNpiyN
	MdS9n1Qv4H/t+fh2/FNuxKMc6P/lJ9JbnwVTHRxC4bMNsQUDYeIt5IyK3qG+W2g1QiXB2e5BBqZ
	3IhLZF31Mz8xy+b1lA9wBRWxTBCWnkajC52KnbNDGdSUJz+cxMz9HL2jMyR4Bwz1AKSqVt36tSe
	yFapmUncqBKdxrR1aogbb22uAn7HQd3KKt7X5cf59ZKn3+VKpXrLxIrhNOJmGwTf/VcWXC2GS1T
	yDfToS/0OGegR/jTMoMsbU7Zc3
X-Received: by 2002:a05:651c:e18:b0:3ac:e304:65 with SMTP id
 38308e7fff4ca-3ae67323879mr13145831fa.29.1795036959773; Wed, 18 Nov 2026
 13:22:39 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116111802.2442456-1-lukma@nabladev.com> <20261116111802.2442456-3-lukma@nabladev.com>
In-Reply-To: <20261116111802.2442456-3-lukma@nabladev.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Nov 2026 18:22:28 -0300
X-Gm-Features: AclHuK-Y6IDFt9qpjrJDNGTsfQL4BjSsgswFvwywajIkisS3KGgYyNt_017jMzc
Message-ID: <CAOMZO5AiGRHNijfDcCXhsrQDwcWDwHNsxVEoHuEaGdVaR6JBWw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: freescale: Add device tree definition
 for Cloos CBASE with i.MX8MM
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Daniel Baluta <daniel.baluta@nxp.com>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Mon, Nov 16, 2026 at 8:18=E2=80=AFAM Lukasz Majewski <lukma@nabladev.com=
> wrote:
>
> This commit adds support for CBASE board, which incorporates the TQMa8MQM=
L
> module.

You missed addressing Frank's earlier suggestion.

Please use the imperative mood: "Add support for CBASE..."
