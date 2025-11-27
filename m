Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8254430504A
	for <imx@lists.linux.dev>; Thu, 27 Nov 2025 06:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764226403; cv=none; b=kaiqSyLeNctRSrHG30x5rs1JCodsepjuFDND5gBkoJzGClr/x3B3MBXoKMMiX+KcLrQnnTBJ0v8V9SfTIE6BmO4In+tPwJ8sMqKr6J8/chSmwoEbrhArG4oxje4IHMSesNG6U34CFRT2rgIMXsyBB6fXvMKsMYDM4C1Rb+lxWE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764226403; c=relaxed/simple;
	bh=d7//LDXSumbJJihDYb9lQKXayXscyZUEfuYyatlPbBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tqZEH/CObOrp4y0xKfKw9n6r/PXqQ5MqHg3ivVRtkuNpIkSuhMp4AH45vDtXCkWH4PMShVCGvAbex2wZ/Xa6cuskzI/I54M+Ru5Vy0Bfad4judrV/2w8dSQwTufsyu6YF+WrUmi0JX9gkqULl65NPk7gUNYs3MnSksj+xqpgf9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G2WXkj1H; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G2WXkj1H"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6419b7b4b80so848300a12.2
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 22:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764226400; x=1764831200; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=amIVj6Ks/T19JV0gGyF2jbDkQIb/QLUq7CyFhU9t8+g=;
        b=G2WXkj1HZjCqtHTx4LwmM8Wto66k8NMQKlZ9jwCEKylvKm2iubGbm2+lEuYO1rg2SQ
         r7/zKR7U4JMldx2Gtk29ClXlAHL5FtOogFmXsqwM2pLhjIzJGq+X2kYh84M9x56IIJjw
         NfiHKfjGFFdD6HJk7HIhRbe5x7SCG9mS0b6S0WEMvYr9ItMTQ2Qp/Qgxu/uAp7/60w2f
         MFtJaj1+jbS4CiYxa7l1tt3DSGP9oxQFKdRRpxshCPs+DMP3AEm8iukV1CRZo9EXH+W5
         b5xvoqh3vPhquR/BEi+mIVwhEFhXORHLU9hNK5h+eHAjMCtxRScWcL8mOzrwlZMAONfh
         0F+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764226400; x=1764831200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amIVj6Ks/T19JV0gGyF2jbDkQIb/QLUq7CyFhU9t8+g=;
        b=sfqNxDH8vRenD1ouYw48BCf+HLAO/iOir7I1XeGt+FDUGPMukgYdtVsoT3aDyVqqGt
         ioX2wWIGLJvf1tC5Ldgdxd49X/47kTw7E0uAQ+S2lHUTcAE9jErORh7Kgd37EFJVdTW8
         MNAYmflaZHMJdG0fZ3klpdRDcIzSir2V5/wxy10VQ9mJRBqBwy5GYzn99eZ+BOVE6QsL
         ki/q61826770IP70GXB+GVfJqKnIoNPUtvxiWfPdbvvP0aWzlKQc6s6HS/lQT0mtKq7r
         ABKm7qBaFxQ65Xk0eEFZsQJbvDMfLN74/YnSFDoubfMUp2rz1VkcDfsFqX9aFVpWIEAg
         tFIw==
X-Forwarded-Encrypted: i=1; AJvYcCU15ib52710Kgu2/n+w2WBmlK+l+ndodKgHnji2a4y9bmOYodv/mXRN4DJzf0cruz4HTkk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFXG49Z5WHrEFoQ13I0T7XQvtvGU0V2FD1ItIUoK6AUBjjbISZ
	7DhIMKRUJEUBMSEPIyMbd8HqrO9Q+Y2dmvlJ+xvIqiAgRvgfjI9AzPAhHYfXeYSRHtn0RWWjuDO
	5ExfPsT9t3O0V/Ec3VAMLuQyJ9s5xdBTtoAVwBXO2Iw==
X-Gm-Gg: ASbGncsvHH9GTkSfx/CFnCLGUNf0sQRJdRnXmRTSLCtpvKZljf0F4px7WM1jZPNo36G
	G+gucrV3GjJf7uNLPO92l5+RCA9mTTBu8nKl8/F3umBbF+rl5jekMLy8S0rlwG0Ex4ORHzyslsQ
	jGmYRZML+sMwSsZIz3AbG2kFc5AM+yIMnhUUZjutK9qtxXDqkxYk4Dps7KEUxTES9WreRgyigsI
	j5eUz+2VUUIGmrNOLw3txr6ohnh0RF8brCBTe12FC1xWYb23sxKz9qGNQn46QsTFFXuS4EB3Qvx
	ETZ8BtLjx/gQGn2asn5W2IFyHjNTD3MunU4=
X-Google-Smtp-Source: AGHT+IFLIn/EUIu7OxWHRGKTwIMu44EVUbsDDWFBWHXN/a3JCflama3pukcsqP1OVrFxH+zuhs1CaG1bDZ8ufGMAHn4=
X-Received: by 2002:a05:6402:51c7:b0:643:c8b:8d30 with SMTP id
 4fb4d7f45d1cf-645546a3a94mr21339934a12.30.1764226398995; Wed, 26 Nov 2025
 22:53:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <f8170513-e08a-46ff-9fb2-310f3e9c1ba4@oss.nxp.com> <20251126220441.GA2853437@bhelgaas>
In-Reply-To: <20251126220441.GA2853437@bhelgaas>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 27 Nov 2025 07:53:07 +0100
X-Gm-Features: AWmQ_bn9e_5hK3VL0q5IanUqFHYeiwridGkV71hmaSPq62Kxvcuwrn80xW_IyF0
Message-ID: <CAKfTPtD3EsD6yPfnE2nbnyuSfFeOEGyLm5jTQaEZP6Ro85e4JQ@mail.gmail.com>
Subject: Re: [PATCH 4/4 v6] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>, chester62515@gmail.com, 
	mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, 
	bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bjorn,

On Wed, 26 Nov 2025 at 23:04, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Wed, Nov 26, 2025 at 03:47:46PM -0600, Ciprian Marian Costea wrote:
> > On 11/26/2025 3:41 PM, Bjorn Helgaas wrote:
> > > [+cc Ciprian @oss.nxp.com, see email addr question below]
> > >
> > > On Fri, Nov 21, 2025 at 05:49:20PM +0100, Vincent Guittot wrote:
> > > > Add a new entry for S32G PCIe driver.
> > > >
> > > > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >   MAINTAINERS | 9 +++++++++
> > > >   1 file changed, 9 insertions(+)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index e64b94e6b5a9..bec5d5792a5f 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -3137,6 +3137,15 @@ F: arch/arm64/boot/dts/freescale/s32g*.dts*
> > > >   F:      drivers/pinctrl/nxp/
> > > >   F:      drivers/rtc/rtc-s32g.c
> > > > +ARM/NXP S32G PCIE CONTROLLER DRIVER
> > > > +M:       Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> > >
> > > I'd be happy to change to
> > > Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> > > per https://lore.kernel.org/r/f38396c7-0605-4876-9ea6-0a179d6577c7@oss.nxp.com
> > >
> > > I notice that most nxp.com addresses in MAINTAINERS use "@nxp.com"
> > > addresses, not "@oss.nxp.com".
> > >
> > > Let me know your preference.
> > >
> > > Bjorn
> >
> > Hello Bjorn,
> >
> > I prefer "@oss.nxp.com".
>
> Done, thanks!

Thanks

>
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?id=c7533471578e
