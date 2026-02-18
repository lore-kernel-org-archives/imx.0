Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF3018DB0D
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 18:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771438497; cv=pass; b=TinzERYt0Hh5aCTDYMDe1DSheat1Ib9QGVemeK/vBneRNgQMU6xja2KMN+bGC6ztIj/EG4g3kwxsMVq4/WBDN9WpL49KmMOwp0rrSsAOO/bPe5E0R4jXI+n7m/w+Qr/tEdAza3zy4eJQFMVBPfqMus4Uhvx9DBg1Aa2tPEmufus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771438497; c=relaxed/simple;
	bh=YviV1LJUtPqR1ffjnWUweO4RqwvYdHYZDmBnJ4iJYEk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PwU+muHsvNh0vzi/wT9z/qB0uktGl8ZlT+B2+E4j9WucXEFff4Vk/uPWpbZL37ZOo1EhyXpqeU0H3oi/BTYo9LUoyC1UoYf3A7k5OkgI9RxO6O98jk2/hszSC6xdbdETMhLlh8XXtQAOei+gs19HV42O4wIKIsYSIoCQzKolmJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bA3yCNXg; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bA3yCNXg"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38708180241so1371721fa.1
        for <imx@lists.linux.dev>; Wed, 18 Feb 2026 10:14:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771438494; cv=none;
        d=google.com; s=arc-20240605;
        b=GsyNCWDRsFXt9oL/dBCCHsuPta/Xs9j4mKDxuONyTC5mLFPGIZF6yuCiwSCB7zbGx6
         MrjkROb0DZ96Po7HfAigmHoN3YA+79qAYxqb9YGIIdDK3JINI7C7xwGh2QP9rIEDMUFX
         RKFYKNkvgS48LhOrBE5glzB2KjdNe9FtP8gAdfJSudPBjRhCanfXPEAYe6WxYPxnmQg/
         T2A/Z4fk16nleggr0GlW9aouMmpJ0nUpD0q9F2KzCpu2LO7X7uIhWA9Inz3joASNiGTu
         zB6TRQa4SAdI7Jh4a98tQbVhO0VoO6tf8Q+E8MSIPTQ4qv9q7KxfHhKLFVB7P2M8I184
         qJgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YviV1LJUtPqR1ffjnWUweO4RqwvYdHYZDmBnJ4iJYEk=;
        fh=NA3asxqvxU1qCUdc/wFRt2s2xDILauxAl3Yr7tyWcAw=;
        b=KlduQu+dJpmr96CR6Gp/rWlNWelg/0z3SdmfoqTgv6uLBXgQ3FHlDyHZ9MQnVffJH3
         JkUILXxNHvKBijB4AvNdDHgVi+aBmJ2XI2M2aduJUVpfa0kyNl/zkU4kupr0NHsE8eyB
         xlLi6Qdx7JkmeppATiBxjU4tFWJYNpL1KUUH+hg+7RIqsyv+35HvY53zq/Fm1WP69xmm
         bQaKKYEe40Ty4i4DZYpmnVo00cS7OK7efr6Rhx//Ddv82zGUoe6CfWetMnQ26G/lZLUo
         mbQRNo24oBNj2Rhci4InoYgJpD125Yt3oNpH2u2D2r7jo1Fysq3YTy5slRN+EbUkPhaH
         3Zbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771438494; x=1772043294; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YviV1LJUtPqR1ffjnWUweO4RqwvYdHYZDmBnJ4iJYEk=;
        b=bA3yCNXgO7hMk/uVDmcD1drGrCzCls/YkEIMm1D9GHvOtHN/ZsMIK/Ww8w+pYBHsy5
         f8sJkqhrQbgQhgA7acDEgX9GN1RKowjkCPiQ334NdLvA2a+BUTAtUl1Mf+au7oiG94yg
         JnuJrQLFtkTc+X73rPqOWziTuE1sTh75JDwUaO8Niz6NYExN3tNXU0ZRLUWiHzrcOpQb
         nDMtL1x3kSgsoPnNaMfGbHKMI7MPgPjLVdGpCihDCtrQfc8WkvEx4g1G/a44vO+3qnIT
         vNzAgseRjMJ8NUAHBYWeYyC/Wm2fijj2dgODvp7QDTg/cgucuHfznXbD5/2Qt0LpgiTr
         xhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771438494; x=1772043294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YviV1LJUtPqR1ffjnWUweO4RqwvYdHYZDmBnJ4iJYEk=;
        b=toA3Kh43vPcMH04YlIzpoYMoFQ78Nh82FBwqNJZjSEssl0EXkbvSlAjy+yQJmi/+Xa
         lRiDwEBlWTUKd6AuvVTUDG+jbuCEMf7wAXA0WEgql/R7yCs2ECM55E9YUyUQli+sQIm/
         z0r0jFSaiGsWZhIjYPuqQyPbOT3mTBaMlIUV9otbCxptxZ1hDtTMr+DYkl1DAlrLr6+X
         wr9Tg5HmrfVyMBM2kALftb7SVtruUVhX90ELHcQZyp0mTnko5sFxDmMsS6eP4r7QMwE4
         QNkgj8krwn53ATLF0/k+iObz6518dnac+sxs0v0pnauTYaG85w/KGzI2nfQ6pbXcslJh
         W7Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWVxZfPqWBA2YVgTjwrr68xWX6evGVj5BQuRQStAPkPATSlsGiXVASWge0Ps1ueHLpybM8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8/YFc0QFVnf25txUE1PiqVM94sCr1jYcbia8OQqSGQ/H+Olff
	cyu3QJETk3tISqI2AUCs+fSX8yQxozblpJP35iR7BuCyC3b9bs+frPRoAk9pjWoNgp8jHrTc+Eu
	33vpmI2Spxjb7HRHG5WwH+Ph96DLkO1c=
X-Gm-Gg: AZuq6aImiesyg43wF77J5pZ+3nn/YAbJgC6ZPK1e4XX2n+iAncEJF8hAZnu5xaH7AtM
	cXCHmzfu3aIA4dsM2GxDwJ2DkvX0FuC+50TibvyUgSKJyVaXjcNXCk8LJMz3wsty7I8GHF3H37/
	q1BGKFlxSH2UgIjb96H57P0VdMq8PxRaQJW0JfKAtRhiXZ0cqUrwcC+sJKtpH6rC+gAoI0GE1B8
	HO0stYjsOB5v0gLDTKh3wqy9NR7HOEZX1LnfFasDDvkS0yFCR0IhvSXty0d0nZYHTy+X823gLh8
	931/N3jvrAvNdPypwEEMOH1wYMIphRYPpHZa682j8mHvVEtfJX53O5nLJc5FPTgl7728r68=
X-Received: by 2002:a05:651c:1505:b0:37a:34e2:88e7 with SMTP id
 38308e7fff4ca-38846ded488mr8325581fa.22.1771438494066; Wed, 18 Feb 2026
 10:14:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com> <20260218132339.32157-2-Max.Merchel@ew.tq-group.com>
In-Reply-To: <20260218132339.32157-2-Max.Merchel@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Feb 2026 15:14:42 -0300
X-Gm-Features: AaiRm53RLXHEYghXfgNRCuxfYIbnDQ70cmKmTheE3k1c4d-bmc6cBGsAlV-rhj8
Message-ID: <CAOMZO5B5k_i_q4cd7SMNAkicF4WfEYNVUSrg8AamQHNpGys5mA@mail.gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: imx6ul/imx6ull: add boot phase properties
To: Max Merchel <Max.Merchel@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux@ew.tq-group.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Max,

On Wed, Feb 18, 2026 at 10:24=E2=80=AFAM Max Merchel
<Max.Merchel@ew.tq-group.com> wrote:
>
> Add boot phase properties from U-Boot device tree.

The commit logs of this series could be improved. Please take a look
at these examples:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv6.19&id=3D256feb5be482315a91c1bd1a1808276f57ef76dd

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dv6.19&id=3D2285ea3f8065f47a6a1b62e6fcfa85105c8c261b
