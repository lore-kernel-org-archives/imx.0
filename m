Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB36412276
	for <imx@lists.linux.dev>; Tue, 11 Aug 2026 08:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786436246; cv=pass; b=SZPDCByZ3wkjRV7PiFLV0SWcrO/lipuvTlLT/WoWGldTWKn2yrnfyzBaTzE47JPAyhNWkW6NCfaQs75dtSv6oRlzGlMZxqJ6M0l8NLAT0cHTMdZ1FpZlifA/MVNhh/AgFMzoT6M+SUg/P0Kk8HfeRTrlphxO7Na+E5IamjwjOSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786436246; c=relaxed/simple;
	bh=5tfluHqupps5STIW6gd2bV81yHlP1aogVix3b1hDENY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tC7JciGn1nAre57lFMGFJxb0yHMcJNu40OwxwfJ7Y50wJQsTUtA0VnOwSPl2n2HtVCXbyaanMt/3+fTjWFqiMdR9T0lBeUMzN5IMYvrC0dDjsx5aDRGDkefba/1po4vyLPyoSHwQ89jhyjAcMmwvm1aVr54A5fKrxovackHxQ7s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMJCfry1; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMJCfry1"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ce98cb8165so8076455ad.1
        for <imx@lists.linux.dev>; Tue, 11 Aug 2026 01:17:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786436244; cv=none;
        d=google.com; s=arc-20260327;
        b=g4t2zsSSvJr2kRa2P6gyoH0Hr+R+ilexeqTx2qYOPuIjDC50tAG7mbV7xJ2ab39NBT
         c+JHeuWxOOv0Cg2fA7/RGrPmbRa7vd8/dTqTcRJ8PMGNss10sF7DkTt09ftdaXyC/stF
         E+/ZYTb5xG5XfzbDP7lC15uyUu4Izv650aUwmK+Mq4V//PPRKhQlzDtHplNXo0sHsfXT
         O0c0WyX3sXBgVLE8ljXyzlrOI7r5khiNSdjqMSUEbsrh4UyCdzGJdpwlEDsJh9cVNHDd
         y8Zn+XHkc+YBBthoED8J7UKMsGpBTNoWexh+PJfYekVBfpVgHHAoiCh2g6/8t2FnmEuj
         5uSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/N6NxxZa1/RwsdJJL1XOaQxBTanGcXh5CEXk/SH/G4M=;
        fh=HDPQk5dN/lrEcWdeThIXmqbzOvWDiZj+9RlQNhx9Rxk=;
        b=P1nkJCzUhFfLEDT0Gz5MCJDZXP5XSorK7/V/LQ76aKEfAW4mBkajy0owlVZJX4tAGO
         oEYg4xE2ZyhHzpBzorSRe3GEAP5ryPgANYSYiUd0HhKHxGrMn3yvg5Nuo7r16Km0nCyg
         dry0dkgaWsSS28+HWkyfUW10ik6OCieF/lg3ob5xVrqXY/o7MsrD43UtY+rVQzFVGNWu
         bqUR+aRwy/IUKM0JCw2E+ffND6fOcYV+TWyq6gHL62dlwIP1I/76vFB7CDIPHRxDfio1
         kFWeUXFP0OJaemur3yWOgXhetkpmSujng6LiFmKi6TVjuxUU/FrksueRqxLtq5E0yBLY
         MKmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786436244; x=1787041044; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/N6NxxZa1/RwsdJJL1XOaQxBTanGcXh5CEXk/SH/G4M=;
        b=MMJCfry1MI5AIJ1RUQ3zGmGGyc6Ek5LD+FUU5gmX8cDdSKwCVLdQQ2H25Y0VPHBRfR
         XsocU8PxW7o9ZLCwe1/PMQQxHCaabztQK2A2wRbYB4eaaLCmBwHQpyhgZ5KxkRrcbm6V
         MhKR2Mp+6I3C450nc9J3ifSiKvgp3Yg0QAOoq5X9fy7Wki9d86i3aOpFtriN20ObWg3H
         HASJiCN1zN8+dk9+zSMqAx45ccHd497v2U9TlODyiGMCLt2o4WpgSjUfk1D95XmW9yPc
         ccCPJ3avemfWKEZ+qFcHHYnkBvcOJi+QEnV9yy5HCifqjkRMEE7fmUk+WZ93YiIeLKnK
         jUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786436244; x=1787041044;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/N6NxxZa1/RwsdJJL1XOaQxBTanGcXh5CEXk/SH/G4M=;
        b=Leqfb8c1M5w+aqPzufplzNgsug1wYBGMmbw5K3mV3avABWzX1UXWckZ1lQpg+ClAA1
         mhzGkzxBopDZOrUZEJzYv+MMJqDPyoHYHazlIwydPY5DWoJCDUyP2RW7pYXZ9BFfQuE+
         CQMU9K7oy7alj8++VXvQoo/OYnY9KsQttc4vb38iKLz/qDfaPtaZNr4EywOpoirnWcjg
         /slm2rY0OAXQn102egXSsnNhFINoMfwRJfN0HHb51toztILRuK3RBSvssurIQVt7GmTo
         zgILj139LLXuIVI2WSL8huZEPWrLFbNDtolHivqRq+1cRlFXh3ku4aI9l6pbKiIjaXrU
         AbZw==
X-Forwarded-Encrypted: i=1; AHgh+RqfqYpdrJkNcmPgLX/6NrzB0JRFh6PSND/qdl+934C36PUzpfU2uIKs+tjLAXTcFsPk4J0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyYjvA96ACZj1rZCkqGh3Gx0xc+CR3nS/hudhsFlhnchTjJibaQ
	UraEaJhVb8n7kCaeUMW6NeIPNku8pMg0smOdlEHcNN7t0WKv4sjCurv7FgqM90bOaBjHHVmC8kd
	u9kbnj3MGG8MQXsF5eWQV00phLhOosWg=
X-Gm-Gg: AR+sD11bHn787yS9Y7zjrgFBTgtS8dh5d6hHlA5AqiSPN8+/UgEIBlCunUgTfdDuj9o
	B8swWDSzE4Q4QzNtxI6Q0emH7Uq6r9U13xOjMIx/bldbni6N4K31uC/KIjxe4fEbOAET3G5I4i6
	aZAUuZK6jB1it1H9m+UxHIHFJSpZoeX8cPnNM615LfqLIfw4BXwkypT+nReMt0V137ugbwcn0ZP
	fdoNlN//JjB2xFUqR280uxAuMUmkgzh3SzU3XtX1lSNNiFDIVpqoppqR6hcUpaBArgA8Wx2dXru
	X4H9/vY4h2ogUYjM+Bylnrq1gVgOi4TUFg83zxWZJAgNGhjnw7SuD94=
X-Received: by 2002:a17:902:ffcf:b0:2cf:7ea3:7cf1 with SMTP id
 d9443c01a7336-2d31877be01mr17789185ad.5.1786436244086; Tue, 11 Aug 2026
 01:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <20260810-normal-cuscus-of-argument-4b230b@quoll>
 <CAA+D8AM9s7EX-G246Hf2=DOx5q2qXWg_MjUCaoJ8RggOjp+5cQ@mail.gmail.com>
 <dc40dcae-3017-4e61-8c6d-7e6127e4ee77@kernel.org> <CAA+D8AOQ_y7BdR4h+X6qxFygPU6h1iFV0cYXHN4KB370yM2Bkw@mail.gmail.com>
 <3219a2e7-d11b-478e-ad2e-5f1ec2bbdf27@kernel.org>
In-Reply-To: <3219a2e7-d11b-478e-ad2e-5f1ec2bbdf27@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 11 Aug 2026 16:17:02 +0800
X-Gm-Features: AUfX_mx1LX0wZY0j5iDajd7W5oe3f6Rmcs5OiNPXvXt3EbMHLfrVtGbE60ayIAU
Message-ID: <CAA+D8AO1q-n2S3X2d1ZZ_yXxNrHPjCPvrJrPZmTMOYZM9uEGeQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 3:36=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/08/2026 09:33, Shengjiu Wang wrote:
> >>>>
> >>>> Why mentioning upstream in the first place? Either this change break=
s
> >>>> ABI or not, explain that.
> >>>
> >>> The deprecated 'port' property is retained, so this change is fully b=
ackwards
> >>> compatible and does not break ABI.
> >>
> >> So why? Drop redundant parts.
> >
> > Ok, I will remove the sentence below in the commit message.
> >
> >     No existing upstream DTS file for fsl,imx-asrc uses the previously
> >     documented single 'port' node, so this change does not break any
> >     in-tree device tree.
> >
>
> Honestly, it's redundant, because you are not dropping it. So even if
> DTS was using the port, what would change?
>

Understood. Even if a DTS was using 'port', nothing would change since
'port' is retained.  I will drop the sentence in v4.

Thanks.

Best regards
Shengjiu Wang
