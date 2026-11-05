Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793891352;
	b=faL8nZJyaZoMQDkyobddId89jkk655SEG+1OzrUWTSum3784RRjLVeBhinhwAFIwGoEV
	 Wb68Sl/1a4nsl+cEvoCm/PfIZ6DFFOw7QMN44fmcrrKB5C4v7jEbq2knSzba5+aRCfrSi
	 fimzxR59KFE/Pu+J/VY8MTdQw5J0o2a6zB0fDqcZjefcaGKz3UvwJBYKKGFGDQ6Ij2Ls5
	 2A+vALh1kd9WFe3ZPtwTYPc7EFQFOur+QFiWyNAKInUKVynfqLzq/r0ZOdr4VzNcEQ9Tg
	 ordIsVl6UAh5NezaOknkCACYGKMKk8Bj8BesQ9/jYBTCMAZ9rAI+XbhRjua3EIFAD5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891352;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=XBRPpKuaOzxRwmT+HiflPZUBlbHFQH3yMj9t4LnCfBw=;
	b=wVyX0ckOXELidPLHH61KG7rSEBoHakBTtR1lrrP1JW0B75r2ZMOOitBbhejrp93bC/h5
	 rlqe9bzUi5G2ACA/Q++A40H2uXD0eCyI7mHevrazwu79FDJ/2VCRp69Z9rD5pQoJ7Las+
	 TSHqm/LLG0bfpLz7Kc5Zi9QztUXS0jJW40eEViP4JB1Bg/aH8oEluFmYWIqTX6SMnxVWl
	 dL+GvTdbIwFy2lNeEnih+WKkIUITmNvLGXGjY+UAJCgwY3Glg8RIdacEXpdEVSTY+Eu7t
	 VQYzS+1/Upmip/3cDJIUtZXSPugG+ANcEvRQCrWKDT4JWFKPzS0yXflaPmrMFEf0/pw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Zlq1Dbqp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45690606A33A
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 15:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45690606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Zlq1Dbqp
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::109])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EEED32020B9;
	Thu, 05 Nov 2026 16:09:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793891344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBRPpKuaOzxRwmT+HiflPZUBlbHFQH3yMj9t4LnCfBw=;
	b=Zlq1Dbqp2HRnLFPnH4NElHiteCptV5CDdT13FhWecMKu7AxEteFGJAXEdcX79xWwPkf8U/
	YRYJGkkJO3bkOH7tCMTt4QMI5BaTh4JPDMPVi2iQodk6IMfRROsaQZwrDZ3Y8dGNUntrMn
	qAu1TebES3vAjZa++2kAmZrzaufnZCvd54cqRnZEtF7op0FnJff6VLehRwA6XvHI8AQak8
	y2bnNulvW47VCA2xFUKuP4RWNpQwbJR/blrAJkv1JNrKmQG/lG2vzDWm5spnC79BIsDo0N
	xyc+fx20Ef/jYOLoW+YmY6JQtw20RmuJvOpJ9y8aeb76wR/D/4VCCcuPxiEUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793891344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBRPpKuaOzxRwmT+HiflPZUBlbHFQH3yMj9t4LnCfBw=;
	b=bCNfkJTUdlwgrCyXrYY/qlB23nWsftk3X2Zbz+m0/xT1uBwCOgBRP9KM97rdiSAUwE8cGY
	3pYp9P7zw2xW3/A4cEbHByOsFgXboV55wUR1OQ5oO9CqDIg9YOfqnSqSNO3PxIzy0ukaZu
	rE3TvDvRSnS5C26DB4RwAx5K1Il2ntN615dfvZ9EIPOiDrLUCRkwzUId0OZW9zbYtcrHLH
	UXWkCAlHGK6jnqVwfb+HmJ0y2Vpd0IVSWSXSFsky7i71zOxKsbVBx+1wx5+UKJb1/Waas3
	vWsutFH1FThY4NWtgUljR7gRgMRtmYgbNkHTK6LqWn4EwL6dZSQh7T/AU23WCg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=mfe@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793891344; a=rsa-sha256;
	cv=none;
	b=f2uhe0YUakXdXc7CVHsvPJzqld4h7mT7TBr0xRBzXPpMmdMa9kFUlAwcJVelBmPxAoC5Ri
	+ZzaMb4yasuaW5DyWCFenag0eviFydcCp6rFrWBbtzHVF506sO8DjF0xxnilrbyz1+hu15
	BBTfjbX9+1IK/Ov8fUjMYJHpZrFunTDHCOM2TAk2OPCUcVqK69uduT3VOnhqsCjwHFZeJy
	/k0wi6vs1odwES5deFDejjyJdgSZicUBmX8xNKBZJB2bVnPQGKrK61Y08WR2DRbbRem9yi
	dYgRjgn8+Qyu6lXMk1e3/Oo7Dvbxr9oyDtHszzs5CdzZEPK1gjETSW9HFj0uFQ==
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1064)
	id D9C261BF3BD; Thu, 05 Nov 2026 16:09:04 +0100 (CET)
Date: Thu, 5 Nov 2026 16:09:04 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: nxp/imx6: Drop unused .dtsi
Message-ID: <hvrfbvmyzsa6npzh6wpa6o3xxygslqc7g5ukt7ph7ty4povogh@wge2z4rejnf7>
References: <20261105144920.2796623-2-robh@kernel.org>
 <krvg6bwsueypasvt6fqszh7itqr3gu3qsqbji2ernqqy6g3t4c@b7hqenmaugik>
 <CAL_JsqLETyrx7ew0zirS9r6+3=GEFaRE0g96OZHYwqjxMCZKcQ@mail.gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqLETyrx7ew0zirS9r6+3=GEFaRE0g96OZHYwqjxMCZKcQ@mail.gmail.com>

On 26-11-05 09:06, Rob Herring wrote:
> On Thu, Nov 5, 2026 at 9:00 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > On 26-11-05 08:49, Rob Herring (Arm) wrote:
> > > These .dtsi files are not included anywhere in the tree and can't be
> > > tested.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > > v2:
> > >  - Rebased
> > >
> > > It's been nearly a year and these are still orphans. There was a promise
> > > to upstream something for the kontron ones, but that hasn't happened.
> >
> > That's unfortunate, but these includes are used at least by the barebox
> > bootloader [1,2], dropping these would cause a DT regresssion.
> >
> > Would it help to upstream [1,2]?
> 
> You said you were going to do that on v1:

Unfortunate no Kontron dev was chiming in. Will do it now!

Regards,
  Marco

> 
> >> I will add the som.dts, please don't remove the kontron dtsi files yet.
