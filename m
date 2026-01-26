Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F4A285C8C
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 19:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769456880; cv=pass; b=cDoSiddAW3Trj1RQwCW2tflkRZwtNX1AZdbbRPCuT8zrmx2efnMsATMIPr2XsPcKLobedX0GeqeEyix/tCWRnEf81LHdaOJBikUfmjJ8qyDApS3uX3vgh39jVdKq7y0vX7gWmbou08N5ITci05MH/6RH8iYP3A62+DAds4eGMwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769456880; c=relaxed/simple;
	bh=E86U2Pp1+kEMZ5xTDOjPoM6DE7sOtiZh75Z6gIblXu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SOinfnYd7+zETRxRZDup2bmZWniv0UDK8ZWuljczVkpe4Emuh24j//vTRtpSr4LzvHELWBkrbBivv6qx65NsRM994VuxfVitW/uTLqXsUYFIjct83gI0oQtjDu2rs4ZCJm9j9/xXozW8WBrGnnqYadY/y89oNz8Pqystv12wDV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIzAkmIQ; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIzAkmIQ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59de8155501so3230740e87.3
        for <imx@lists.linux.dev>; Mon, 26 Jan 2026 11:47:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769456877; cv=none;
        d=google.com; s=arc-20240605;
        b=N0b3WyYJp2vSOKiQ1K0zlF7PeJoKwL/vDkVFua5PrXRCcluEDnsCRd88JkTBx98dh3
         RxEgavIPyHYSttV3YVyeNXVqLpS78/vskR0NIqnGoxAJQJMSUIWb3jUynWGIeJKhTsKK
         vSIqAL1tGXbCEFV3Wfx2j9O03w9nhO8z7SxFO9jTIUPQoWbCsZ32HHBYiB9RwDyB6NBM
         wBo2GE6MWXTDHOJTHnD3Ora2buI0DHqYSRWOGWSqfL5YqkrANelAKh0urkRv2Eiix4Yg
         epIjyn1WK4tgMjTZAzQxMPsTWryGfdvPwbfy1I2w/GOtfLKBb+wm8io94bPn+MER5sBy
         etcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tvHi5BlR/jfPN2hk45XeIUKXD0zHTAJed9qhiZYAB1U=;
        fh=Co0F3N9fgGuB3EWp5PFvBplJM6V+lKeyXJUu/DZ4Gg0=;
        b=F8GjFSTpDLZ0PT9K7NM9Ly6CenOOrS117k6Ng8Cu6uUgzY/tnPcSLRs4s9Y5FXn6ir
         DcYJFzXpnUy+f8R1PsLP+01FfndwCQZ4cB31OJHqOi2rYy+MMuQkbcbxrzI1cMq7nkp9
         gWEGyjgmmzA3kTUn+gTBi5ElSPLKqRZrX53O6NRVKMcgB6NdEUtIr4uQMMaLeLzbdqQU
         6VrwxM3mZy6GNANCAsUvbviUVZygHfbNk0zkqsOo6czehN35pOPOHWWFyk28dDuzftXI
         t6+SU3M9ZgHAiTZS+CjvtBYTTHmj2Sj241/jUaPBjVbnDKYHh2n41G/uXHFmhovAYveC
         MW2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769456877; x=1770061677; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvHi5BlR/jfPN2hk45XeIUKXD0zHTAJed9qhiZYAB1U=;
        b=VIzAkmIQOx9FLWbz76/26X9tY0vmEXLjhZPZlntA2wRv+2WxpVMWOdyO4hXuUQgqE4
         GJ4d92mlN5LX4u9Zofsr8hmlrp23CRNpXt4joaM8E/J8irNoDCQXjOMJNz+RftYFXffE
         GeGu0XgD757AOToDOBlbB7+ajKcXDers/8CdzSzNZmnlDOTLNcrA+agdZVj/xJnhUGYG
         2aeKVjhPHz8IIUDnE7yQEfUmy8//vxhvk6lYuBHRkDtKDO0ghKYqfFZqsfeVZJV4NuLu
         YuGilem3WaXNk/9IRgQmcXsxpHXwNJwkV5lQJ1jtOoDB8zRqd/xzYRsr6swkp2QgcU+t
         VZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769456877; x=1770061677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tvHi5BlR/jfPN2hk45XeIUKXD0zHTAJed9qhiZYAB1U=;
        b=p6L3snZf0KO0pQ7iZCMC1nac/BOCzh6SY95RSiKIZfg370ULSB4eKHarLcMdh2JOay
         0KuY57qD+aalLh1fOFfogH4wVhsIGEfe9kbdm+CCaqFKA6ViojqUxNo+XOG88Utwk5Yn
         UI4BUzCOJmib9J0siZM2EOj8U3pJIXO3h5neUiuYa3w/BGVp/2gU4c9wqagUdgwUsG9g
         YpTTq2IH8Z4AUD6AGZvWn34QcRee3wL+F89Xo/Tfeb9Tgr6KdEQewcjv64uXZ77Gf74E
         FmOms0zGdEW7I+U2FcAPbg4zruhjU6NwXGEhoWJPgCwMalKnSly3Ktb1IOhaDLXFYGj4
         6Qxw==
X-Forwarded-Encrypted: i=1; AJvYcCUE/xigqFiYLbiAWi2v1xKjzl7REeXZ85ZrjUgMFUQTNFvdm/6f5C31r16YRzK3SivcaGI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyxebqJw9DcM4Vgs7E9rh0sqKpD2uHxDS8YZaMSLdumRNgeWxyW
	m23YhPw6DAB7m7J/KTMg0QYzA3Y2/7GtcjxjmG+v2D9lodZ409a+VN9oyrwRdUB6gCYgK5e0LKL
	BbzdXDAIb7UNcAXWFofvZNGfi75G7Wgs=
X-Gm-Gg: AZuq6aJG9aaM1RUqsARa6WuObVuPWpm1x7SO7qlWuijB7MNmuLoEBcQJ/JExC6Z7w9e
	ifgZVJZYeS46glCQ1iS94QoarxMsu+A9su+yq27zmy3TkIJizCPHha/IMZ+8ShJT7jAVlW0jD97
	Ba8ro9hcm+SIe11+Hk84RRSZyFMVfrp1Ezv5973zOlecBSZA/6GExHd66wffYKIFn/yYNefYGwR
	kITRr+rpjEiMQJo8NurItysFGeb014UPr/Bvh+mTQLFq2NNjd0V0ewCtG5mj+QQXm/6Zk3OXLPJ
	eR7sBfdVd9QDSHAq8WeXsOmIM0I=
X-Received: by 2002:a05:6512:1087:b0:59d:e9f6:1391 with SMTP id
 2adb3069b0e04-59df3a1408amr2177134e87.34.1769456877066; Mon, 26 Jan 2026
 11:47:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260126115349.1750578-1-lukma@nabladev.com> <7671b833-f823-44cd-b5af-0b473a8ae23e@lunn.ch>
 <20260126203307.6076ba9c@wsk>
In-Reply-To: <20260126203307.6076ba9c@wsk>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 26 Jan 2026 16:47:45 -0300
X-Gm-Features: AZwV_QizXfEBcPuoLKyFUr1dg6OQ-LmaBQRERKbYiAht9E5yQHfaWrYosy_qY4E
Message-ID: <CAOMZO5C2Hg06wb08cRDLCXGDS_rmUAq3fC7Jm++kSumjukyuXA@mail.gmail.com>
Subject: Re: [PATCH v2] clk: vf610: Add support for the Ethernet switch clocks
To: =?UTF-8?Q?=C5=81ukasz_Majewski?= <lukma@nabladev.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi =C5=81ukasz,

On Mon, Jan 26, 2026 at 4:33=E2=80=AFPM =C5=81ukasz Majewski <lukma@nablade=
v.com> wrote:

> Conor (on CC) explicitly asked to remove VF610_CLK_END:
> "[PATCH] dt-bindings: clock: vf610: Add definitions for MTIP L2 switch"
>
> ------>8------------
> > -#define VF610_CLK_END                        191
>
> If end is modifiable, it is removable. If you need the define for the
> driver, please move it there.
> ------8<------------
>
> I just follow what he asked.

You should still use VF610_CLK_END. Just define it inside the clk
driver instead of in the dt-bindings.

Please check these two i.MX93 patches that explain the rationale:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv6.19-rc7&id=3Dc0813ce2e5b0d1174782aff30d366509377abc7b

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv6.19-rc7&id=3D0af18ba60752e8a4ba34404c1d9a4a799da690f5
