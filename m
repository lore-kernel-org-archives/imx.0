Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC362FC879
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 14:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760969802; cv=none; b=e7d2N1Q2aUuNKZ1W+BgKnMRg59vUyM4PQPg6wcO3v03YLlunTW6u6lV8AbmkgiZmaDjsQ6d9mneHfr2wt5ntkQtOkJpxmWxWnQmRzn3F29RbGNV1WWhI8UkkaD2QIfgj5bbuLRQM8cpXkYiS/GjF7y4Jnj8hoE2xdi/VIrvY3O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760969802; c=relaxed/simple;
	bh=bqdq9WmXPaR8Gsjoe2b8oxuoY7eohXxoBpzukdwSAp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0gMxfqBW93oSALkWRZtUGLwZ3Shwbasv8hQFzvA0M5tTl2UOvZv10S9Ojx+BdZaPN+bGt60DJF/2qMz3i+8YJ7op0LbP7q23iwvn+VbhCe6v/63slWkxD9AOVPEJeCNksIjLpZgt8YzbctQCMAzoJ8OfZ+f5AiBi50GIj8KWE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSswNSKI; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSswNSKI"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-27ee41e074dso51976645ad.1
        for <imx@lists.linux.dev>; Mon, 20 Oct 2025 07:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760969800; x=1761574600; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bqdq9WmXPaR8Gsjoe2b8oxuoY7eohXxoBpzukdwSAp0=;
        b=iSswNSKIiyb9qPgE2zsWHyDgJru9Dr98iJf76+xlFQxXE+VRrXcADH3KfQQxFXOWko
         FQNmFDCw4X9DD8UQNT7aJY5NzBBxAqUFi+UuN0IMzdOZr6UAbZSNlNo9O6FgauhZc0QC
         OzeVA3aAvPSL9H4xc2wpe/vwcNQoLL5bk26zSaWfEnLH0CKJ2QOWVChf5EZnuVgpBsrg
         X+ygGfL5jFjco74IXY4wNPGZQN9POXNY/D41K1Z5GgIK3yzZ1XasjGs5363tjbdN3lJb
         Sfo/PeMxxR4PdoLvDKU8YtIIsRjI4zRgXqVye14rlF+RTutLYBI4CQ2KVb1xe0ckxkL1
         T7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760969800; x=1761574600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bqdq9WmXPaR8Gsjoe2b8oxuoY7eohXxoBpzukdwSAp0=;
        b=pSOtDyjeEyZPMd5DfpT90oYjPrIlU6D0I1Y79Rvx61wiEdHxTuy1GLVi961J42zTh9
         jRtceOvmUbO7ryOEnzE235zpbZ46J1jkQeBJLWzvVVK5yxhxunDTYf4TuF2c5MtfPAwG
         l4JYYX9CWKbpqKSpcVuUJUGCiShhCkgXGGTHxAXpRPEaZun2wgWQAA92ivERhwQWU9K6
         IgdGsBEB1DZNZ46dsr0P609NFm6AoAcQa2kTJ/Y1qxzWVUdTkNqXI3ZgUHGH70BS1Irw
         XKVpW3uMLcKslOObpyqAH1mlRCidAZYFG3EKcovYdnRC995a9aZqPNZ5rh47PdUwAn1C
         nSwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEpEsnJKtmrHjXVak3lMByPMkwxTRO70mGP+hDx3+gVaiRrTDODX0n6EzdH21EZo9uM/8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq0LWn87GzQAwiZcTNMZYGH5vPbrzdTvq6brHD5xDMYA0pIdt6
	j5nVQWUn9SImWzKVPjpRgmI5txn1++hOEBIZQX9U+27zv3cQ7PF4V/EtfEdluOmCur6D1i4od/7
	d4pQYe54zSx5nHG9NlJiNTPQZ8cT/FS8=
X-Gm-Gg: ASbGncsdpUBxP9OHNzo+zpN8JbuRE52XaqwEpFoOiVB6ZUfew+Q6hxsKT9QLHMb+msv
	DdFhrmFYayPTy99fHCs8mcvGMaobBEXFdp9ijNIjI8sEe6F28IwcQYU+YDn0Jt6127OKtf4Rn0t
	3Un9Of3wtBAFtBuBw63O2HSkfLwnxlApD5ruWQS208Z9FQd5KhAfhp+ACse6SzKlj5NbPPQBrdU
	isdZPawbqWIYRqmfW38f554gt1ATAjPurrv3N4pXBhyrlklUlO15PXpizQSwInp5DgBF5evhS3F
	poBgGiiSgb3r1KuUzMv6ABb0
X-Google-Smtp-Source: AGHT+IF71shr5BTQv0oq5eLWvgxmXcOQ1nEZ8rFk3kgzINgGyypUZnjlZnnQfErZnclV+r8kM1yF7mXz80sc3mNjFCg=
X-Received: by 2002:a17:903:11ce:b0:290:9da8:f88c with SMTP id
 d9443c01a7336-290c9ca6b61mr160740585ad.17.1760969800070; Mon, 20 Oct 2025
 07:16:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
 <20251017112025.11997-7-laurentiumihalcea111@gmail.com> <aPJZCv+iG6cuxsj4@lizhi-Precision-Tower-5810>
In-Reply-To: <aPJZCv+iG6cuxsj4@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 20 Oct 2025 17:18:59 +0300
X-Gm-Features: AS18NWBTX8pCKgoouBoSyxGFd8xpmwwpvcDYztextRp06KZCPCFp7jOkfhl48Co
Message-ID: <CAEnQRZBd1nadLPE0NSWOJLRNwFEnRhOTENv_vestHCLxe41Rbg@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] reset: imx8mp-audiomix: Extend the driver usage
To: Frank Li <Frank.li@nxp.com>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 5:57=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Oct 17, 2025 at 04:20:23AM -0700, Laurentiu Mihalcea wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >
> > Some NXP SoCs integrate one or more, per-subsystem, block control IPs,
> > which allow users to control the assertion and de-assertion of the
> > reset lines tied to some peripherals present in said subsystems. Some
> > examples of such SoCs include i.MX8MP with AUDIOMIX block control and
> > i.MX8ULP with SIM LPAV.
> >
> > Some of the aformentioned block control IPs exhibit a common pattern wi=
th
> > respect to the assertion and de-assertion of the reset lines. Namely, t=
he
> > user is able to control the state of the reset line by toggling a bit f=
rom
> > one of the IP's registers.
> >
> > Linux can take advantage of this pattern and, instead of having one dri=
ver
> > for each block control IP, a single, more generic driver could be used.
> >
> > To allow this to happen, the previous approach, in which a single reset
> > map is used, is replaced by a per-driver approach, in which each auxili=
ary
> > device driver holds a reference to a certain reset map.
>
> Can you shorter your commit message?, basically, you just add
> imx8mp_reset_info for difference auxiliary_device_id.

It is always preferred to have commit messages trying to explain the contex=
t.
I have never heard anyone complaining that the commit message is too long :=
D.

Daniel.
