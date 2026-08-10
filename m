Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D4938758D
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 18:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786386398; cv=none; b=r/wDqsLlo9rDm/re0uCO0KE0Sqmvf6vEWC8DJolb1K7lmrjz/qjTPyQnHZHXL/CY5FhDawUwiIWwH65yHwMeWFgrTyPkM8GLA4BWVSuqMG4po9fIfVHulag7HqkkwhFXzuMlK6e+0DmHN9JaPG9+gvIZDMharbnGxsJOzat7R/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786386398; c=relaxed/simple;
	bh=uckYMfA+3rj5zvRzcktnwG8O/XsnyeXAICZ5/FhxyPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckhhx2UmjolZYKVbfpAnPXaINY03jRPyDQGjuMNzboZTF+AGja1ADRho+zfLjx544mtTIg0OsTArNxt4QhRiXQRptGTzwZUl1LA5tBkNH1H6mNBzDxJJHPdT7Ha8Ia+CrCdLgfIH0sP0qi0pqttLDv1KgecgMm5I1tGhgz5i+kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7TgSE5g; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7TgSE5g"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-848643382fcso2059012b3a.1
        for <imx@lists.linux.dev>; Mon, 10 Aug 2026 11:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786386396; x=1786991196; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kImCXwl4S/l00e8WQ0YV3wOiF3iZg+3YUcCfhwwyF/0=;
        b=J7TgSE5gBYOdRPGpQuJqEohqtCoAIcEdSZjjlEjP1uNzUgKpyRAblrv+39wJyjCCW6
         Hz8TmGH8K6ha50gmzUbaIz87bhoXy/rV9NKAiXIqKw1EgAiwYrvaDidVbXrH0mwtPR8u
         fVWW9i4GMj+IjCQa5BSXiQ28VRF9nkeHH1bR8qsQkdAse3SWZb+CRpvso4zOVxpAY4qk
         am2dQ8EmIQxMQe8dWgZ56F+Q2y79ZH7aNb5ZHjhtGSUg1GAbAL9SZ2xFhDZFEq9z2kSS
         LpLzGbU/dipC/BdiFGyW51ZoEgF8bl3eKa91G8hG2SWCbTQe8RXDCPDBo/gMK8/vxLQe
         jlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786386396; x=1786991196;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kImCXwl4S/l00e8WQ0YV3wOiF3iZg+3YUcCfhwwyF/0=;
        b=WpfvHv5daB5fO6gTxhZy1sqi+5WDwhhZtmDwZiipc9o5XEZN8Y1g0LJzFjhPkn5slh
         yetOuUSOOqG4cAhPw4CNAgTxkR5Mfj0P1FvvGR46Ot900h0YJh/PL3+AntOyzSD9Cx8n
         7K6gwCTeVexK1VySmWMr8GCyBYumPiKcLVBOu33EE4+vjm+o/5VF4rlNKN2JwTl6WkMK
         qwwrVZQpUyhGJ2+d1IGkVVdzhZVR1I8JJezE7/zGLOo7Mzql27gQQSz4bXaVlwaiIdKa
         AsZLP1iY3j3NwaVxMYyUfHlGTmyIVkuL0cGhfgqtsc7thx+IzqD2kl0EjxSJG+WWABVz
         vC/A==
X-Forwarded-Encrypted: i=1; AHgh+RqtgedmATrgsJhfisYnAtGV+VEjQ5lVqPuis7VitKFshoAgty9JC0hNC0V4kU6dxcrbNwk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6uQmtfh+hT0FSu8mN0qgGFb3+GuJKNQDjV8ynGM0IHmwuJ2Tj
	45XfweYvev7gVSjbY2LeUzlSSJKViiwwaKK/B1VyTdQtKCBXwJRGVW8d
X-Gm-Gg: AR+sD118P/hfDgbx1CviiOzJwbCT0o6+BrdmDzRIBt21ut1myfnmzGI+yPzAyi0raFw
	m8rtfTU+hZcPW/AogHNjg7Q6a9dkjAgoMmhYxtfunH/Wn35iF3heX2W85aW7Ygb6MEQ/pYcxvyj
	D7JMpgbel3OPgOhSKbT63DEWL36d8Pyvg+LB7xA1ye+mb0az4tw3slap9ZZMSloY6dhQLh75W9v
	3fzhXr5mAkLE4qW5pSsW4jn4wOhpFO5hm5DabwMAU/YJG4RWLBLY0QyjayGaAWATEy/h6YsLpIo
	jOdeBj+dYt/7JmO83q/91OuhgNDbbHmBhuEBKGurDJ/Uq4BgcEsBeiNFbmIUZe9uFYFpSm5sWkh
	CIjmO2nuXntHUfTMKtqWtcJsspDV5PM0JO7owxekZhHh35ScUsqEtMOxL+mSp2DtgZ4oLwf96tS
	TQ1SFkhbGNYbcV9IMhzLAs+Tq0xUFVMnu+IDmytrznGqn5b0qTZ68lGVTZIYoSTiBLaJU=
X-Received: by 2002:a05:6a00:6c82:b0:847:5ec6:3afe with SMTP id d2e1a72fcca58-84f2e0588demr52646678b3a.31.1786386396492;
        Mon, 10 Aug 2026 11:26:36 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cadf2sm4377478b3a.22.2026.08.10.11.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:26:36 -0700 (PDT)
Date: Mon, 10 Aug 2026 15:26:29 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "leonardo.costa@toradex.com" <leonardo.costa@toradex.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Sherry Sun <sherry.sun@nxp.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Hongxing Zhu <hongxing.zhu@nxp.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [REGRESSION] mainline/master: Apalis iMX6 no longer boots
Message-ID: <3hxiy6aaiagt5zunntpidaeqc4or4wrebf7mu7asvyyibqmvo2@xhvasdqp64rw>
References: <20260629143439.361560-1-leoreis.costa@gmail.com>
 <20260715234736.GA288957@bhelgaas>
 <VI0PR04MB1200862BE9B7C137EC7C18AF18CC72@VI0PR04MB12008.eurprd04.prod.outlook.com>
 <i6x6wpua7wlwmdq3hitoo53wkptgp62tvegmkabcru3d54eqg3@yk4eehwaarn2>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <i6x6wpua7wlwmdq3hitoo53wkptgp62tvegmkabcru3d54eqg3@yk4eehwaarn2>

On Thu, Jul 16, 2026 at 02:09:19PM -0300, Leonardo Costa wrote:
> On Thu, Jul 16, 2026 at 02:15:42AM +0000, Hongxing Zhu (OSS) wrote:
> > Hi Leonardo,
> > 
> > Would you be able to test this patch on your affected boards? Your testing
> > would help expedite the merge process and ensure the fix resolves the boot
> > issue you're experiencing.
> > 
> > Best Regards
> > Richard Zhu
> 
> Hi Richard,
> 
> Sorry for taking long to respond, I was caught up with something. I
> tested the patch and it solved the issue. I sent a Tested-by tag there.
> Thanks for looking into this!
> 
> Best Regards
> Leonardo

Hi Richard,

That patch might have introduced/exposed a second regression where PCI
devices are not linked properly during the initialization. Sorry for not 
catching this before, as I didn't have any device connected during the
previous test.

Link: https://lore.kernel.org/all/bl7i3obu2clzsgeoct2a4mtfhv6typcjdqmgneropf3hpgwve6@n2m5uhlduw57/T/#u
