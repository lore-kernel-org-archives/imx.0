Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794190985;
	b=GTHlIFVsbB4VBcehJCgoSxMOA5Ls+UcpiEbYqqRwbF7R7IvOF0iEUcbmwfkuVTygmDAX
	 YbuZf4K8WGO9rre5ghMgfwGZJGaGckkl2YVOnv9Y8s2r4/lw0c72lnWKahAwTSheJ7Adz
	 jmM1OyBaIyAbWEZW8jBJAj0hmQTY3lTDkpZMYFe88il78/zQFNOUUFl5Ci87DvSz/h7wp
	 /K2rJ08eZ4DSP6NaaeUMPmwuYDcEWW3Ed/JWG+KuQUR4fobcilvjRCjOnvGzwz9nbeiRB
	 p0eC3R795apTmVRAZhbn9Wvnrp6RFd4QTrRTsFUhYW6UsabEw6kbDG1nOkouw62PLTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=;
	b=y81KwI7WvlzXFD4z9aJlIbl6fxHZIuoZIpbHixfYa2431EPmG23cl5auBf+IWjV4HaRo
	 vsZM4B9rIQQ1eB0RnF57CLOAx/JMWl+O7YqX23I76DnyMghTg8BI+xt8qSIAaHEPhbtTF
	 CfxCC4NNCVfDgC3Ud1ACCscg/gccYDn7wf8XLvJzaxQ5KMQXeHQXQ390x8eA6NKUF/mOi
	 JbgDqDdJtObVvtOQXVmHxLGUyvqNDWGizYL9LnpNRT5OeogkCAwxj5ZqX+DxGwQXtCb6F
	 ErH42fAgWhYBui7fK8ioG+zz8HwywAUjYesuiV53lDcBW56Q9uN/oHatsFBZKiTyIRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKT0dJJ0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F537606A322
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 02:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F537606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKT0dJJ0
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso121884a12.1
        for <imx@lists.linux.dev>; Sun, 08 Nov 2026 18:23:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794190984; cv=none;
        d=google.com; s=arc-20260327;
        b=FTGTkciRNRSKMjSMX1mbvSPUk8kRSTTuLcpfdSBPxw9V/iL1nGvu+jsZOXf3UY4kCx
         VoVZ0V+XP2j417PwD64L3ylyWncIW+lK8XaXhPGNrGH7TITYjcD3Ah0tY/TjCRXg+0d9
         2dfVOhdtGauqm+sy1Vw/grLTW/NSbvxR4aXK2BWEUALWBLDJmkVlO+Nl1WmBWMFh64tZ
         1Lq7pkr1HC3tjoBF8MdffHe1fdr4hh8huTxn7UOyZ/mHQhxUtF4Pid0t/LxEJILVzbsE
         HzZnmRcVTn/XA2MmuQ9ap4o62PWa05iQamu2MJ/tlIcbnUJ8dTXzjQQAQbroGRBp+Abt
         jv3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=;
        fh=9xyiUe9jN/SgPcYiOY3KvH7VGcLTgMZ6p1tcBbLn2FY=;
        b=aP1bICxEtd0JDPl4iOqMyXIZSmlGku/nMym3sCtmpvI69Y6JMA5K8XBpPpPVLUudx9
         EWTlG715qTUbLkaA4ZWZ6buPTkrUMEVrk43NrCVOjDKw40M6P2qwZP2CM0hg7ZR30HJp
         6Fp5opxpSKxyx8PakBYvUKhLi8Sjm8a8+tCB7VbbMZK9UtEUJe9VIGIgMWPNhLx1um27
         Plu2L842yH5J2ipR93+Ijclo4HDlys+3DQ8pnr9IGZp22nCn+hF8hyFIzgGJaaBHNNX9
         qD1yhvx6IGmIqiUsmHNu1iuhtFQnLDdRIa3Mb3jbYl5y4IUqqwselSM3v2wgu5GxxxAK
         yeaQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794190984; x=1794795784; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=;
        b=dKT0dJJ0X5IbMNH47N5a0clkMvJenJ5QU+ChNm3jB+TFA0BaGqM0sH8DAqrWf2YVQV
         CARZE9S00kOpkbnPrT+PonHRrxO7WcENNaYpehCibXQXlHAG/BsuAmpg1hJYb4Jn7YDl
         8uNFbqxbeAxos1QNg8/Edj1np1i4Pyz7f+RhaRGOZyEZUr5r+8cOK2Go9wqO5m9unpMd
         zWBjBLPh2iPncgW2HFO5oOM3E+BYchph8ds6fJ5NSHElwdJtMCAWefNV8wayAb3C0qzY
         zwrKKcZo+waF7RInw28Mc3Rj/sI+6byudM/glIQZycSrmZg1yqihKyIzS+lYmmphhPc7
         +2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794190984; x=1794795784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ltUm63Ka8/fIiMKORBqPHL/abasOjV2ks0cibiXpcc=;
        b=BTkZc5Wi9SM+DQZ+Y27Nh3MdBqQ7lP1KYHqGecsouV0Y7O+kaiziFcQhdix8cIxips
         FA+Ww15L8h2briaZHYC2e3xrJ/x1YwkejIXqetjGKvwzsGz+7SBb95q0oc9IWRN+vqdD
         jLO0jMSJHtKA4KUjiyzTBCeArGItyeY/jlt7zINJZzjHRyMvktQoAVNtMCawfmhe6Q0O
         4n+4m59EsvdzwIqI2Ucp5NrsMcaW1EWKwD7NOxvhQF13EdjdfPGf1niz5836L0afmR8h
         2wNjLmZEs07G5s3/5udJui21ztky44cZqSW0eSnHfTuEHDdoGj9dEv7NZEc1z7AufWjx
         sMqg==
X-Forwarded-Encrypted: i=1; AL+hErEj/dIeTAAOBDLx5Y7CNPxgGPtpagVUfZUPdRclCQeNQeNdyutDWjSOOBRELyVTzUaPWug=@lists.linux.dev
X-Gm-Message-State: APuU4Z9/O1gxUuq4JoZLeqM7rAJ3+nSWU5ZBgALhCVtCnJ6+fYYWQRol
	Rsx2T1P7lMy9LhS1LBqG4yimnop3U5hlIh2xcnBElGFsqUY7ije7NIrJ0hH31TH2wGuL6lvnV2W
	Li1Mzt8IOe+lglq4lSzGWCZSXlWPxOMs=
X-Gm-Gg: AYBFou2o7I22fdoPD0QZnELhjOS3fll8M17SNuHgXAs9uydhAwMlcHn7LMXAVzRBRv9
	XgB/+RmFMrQ39brkQ3YhLpCi4B46EEsxJs5ba/QZNxps7vSmtRHs/iewcmm9C3zuFK8cRqV6BNM
	LaPCGUBFHI5Nu0U96XiPvrzml35dTJR36pHxy+2Jz+xB2HxM0pzF8tFpfsdSnRNU6kRCHchsHZm
	FczxG513XCavSzewCvvYTGd0U0XLqKJLL6b3ksTYfrwO4nB7681yCT6XGxnaM+jSC7C/xEVd/Qo
	bS7FSrk73mf8K/nDKAeliVLz7lsug5hsMLCKkSSOFsRczQ7iPYy6zv4V5FI/j+7gUYCTCh/sIx9
	yKZXd72BiT3wHFh04cvjNL9KpNbxy5ra1zJrHvfQD/i2d0qZzNBRVbAjtnQ==
X-Received: by 2002:a17:90b:4d07:b0:3a4:7195:ecba with SMTP id
 98e67ed59e1d1-3b12d488e88mr1529576a91.20.1794190983895; Sun, 08 Nov 2026
 18:23:03 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
 <20261105024106.338791-2-shengjiu.wang@oss.nxp.com> <20261106-savvy-invaluable-gaur-7af1b6@quoll>
In-Reply-To: <20261106-savvy-invaluable-gaur-7af1b6@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 9 Nov 2026 10:22:31 +0800
X-Gm-Features: AclHuK-so4ygy7ZQpiwiv8L7y68F48OdPR-9-HT6EDLnbJ3aW8Kx7LpzrpeA0Ho
Message-ID: <CAA+D8AMxrUb-Pj74wrRn=vEyRUFKWWsR4Eq1LZ2ErsX=rRq=rA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 8:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Nov 05, 2026 at 10:41:03AM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The HiFi4 DSP provides a separate reset control for its debug logic.
> > Keep this reset deasserted so that an external debug agent can access
> > the DSP and perform debug operations.
> >
> > Also require the reset properties for the i.MX8ULP HiFi4 DSP.
>
> That's ABI break without explanation.
>

The i.MX8ULP HiFi4 DSP has not been enabled upstream before. This series
adds the DSP node for the first time, so there should be no existing upstre=
am
DT relying on this compatible without the reset properties.

I will add this explanation to the commit message.

Best regards
Shengjiu Wang
