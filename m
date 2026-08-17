Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E67456286
	for <imx@lists.linux.dev>; Mon, 17 Aug 2026 16:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786984751; cv=none; b=PkIdUeVnIxg+IUuWhLvvU2Y2bJYPVgh0nd7jhfe6tabdEqn7V77nN8WsPRFgs22iU/bzNWgaFRJoIFDEy3otqdzFKO+v53ynMXT6HV4At/l85QLGeeDiXE2K51XL8u04RS9/9r4BXT4uP28zFvxllgohhZw0LK6t2/rfGP1BwYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786984751; c=relaxed/simple;
	bh=7kYNWja8CyH8mpneiEndqSwrG6PwJCW7ROzqwDBd8PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSNKSeAMrHqSJeONn0b8DHqZs0UU5Bw2XJ9irXRie3FbVK8Rqtj7o+0nP3FpqI91Bfbm38WZc3n9kPSgDA95qQmJHVvjXatRPpn/WVktm3nvJ7KANiet8C8Zwsso5UlVtXes1z5YaZkOHymhUUb7olIzNsAnG48a1Rqh7XNiA+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pSFvjsso; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pSFvjsso"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso2788454a91.1
        for <imx@lists.linux.dev>; Mon, 17 Aug 2026 09:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786984744; x=1787589544; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sDW6+B1/6deHWJRz59EqQ3HrDNwA7V1iNa634fXxC5I=;
        b=pSFvjssoNv2lO5XSYozDWOSxdI8Vhjj2BUgJo4UEiayu+0CRbhTNzDyTU30WULUyz7
         xJ69jC9DKMAgubo8kutgmJ7QjbyXVHqM0Al3qF3QbfR91WbwTe5QL2/Mqy72dUjtU9hn
         cL+0G57DQ2Gfa8YdzN9VH1ikLctjTi5VF4OuNZu2MTP3HVokhiLty48WcOtP94Tf5DcF
         pf9FSqJaq7zx2lQxOMBpXiMe2qQuHZmkFIp7kkc9ANnK/1ysC65YYKSaX38bCjkZt9oy
         UGdnlBzp7YA105/rARIeQj1j7IN3cp4Nl+d5k1VEeZd9VcztR1sbXpjTF8J75a04mmVT
         A3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786984744; x=1787589544;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sDW6+B1/6deHWJRz59EqQ3HrDNwA7V1iNa634fXxC5I=;
        b=lvkEnRWgAYgFDeWzbRJJdwVgbQBW1q7HdnUdo+7AWsfHlTme3QoE6nwwt6GaJVGJ+n
         s8zoutemba3T4ojq1ddGBMJBp+arD47oxjwON6x7Ulv9M62fbDOyeysQAZ3bjxDfxRVe
         YJEPMmwLi2Vpu83krbBAgQONQL+a4lMvB2t8ht7DNc3wjOfw2vZqqDd0n/o7Mwhw09n6
         LoHcGRdZVhDzgYIZwTb9wRHryzWWEUWC/hFSFbdRtTNT6+ClswiIp1Dz2zOlFKTaqABI
         npiUM6oj2P+YZiXfzh2EbpbyNNksADnTCKugBi4OrLFgGS+smlOD7U/7Jzqv9qH9rcU6
         iWrw==
X-Forwarded-Encrypted: i=1; AHgh+RoAnHgPVfBakCsbbv31wUGgNfHTI3aTdw3RwIdxL+STwuPVnoqeZPoZMIyQFIMXBBYZZBs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfyI6hF19nEYFOapVfxoGT9UV/bOY4gkNV8dCYf1KKXVAgXfvB
	dG3FXfpBvKnOSnyOTWjHiUi+iL65Www8QRf6P83YEBbt9xMyKJd1k+qVTWObWS63SAI=
X-Gm-Gg: AR+sD12Qa31QA5N7EWyW6hB8vrYn9lyavNCeGtjjPZo3xzBY2pVP2PZiXKDB5MVIctw
	iJeoO/5nMufVZI1ZeEUO/y8C/K0aq4K6sCQSHj29Yt4diqOjLxSRKFCrR47WBb2ICxbrBKsR7R7
	eVGXCNuK7iZYh+luUCGbm2os98Zc6kauVNcBzLoxlHwn5L83mO9mNRmXapncFPDeQ/YEZ96qeRQ
	H4K2qsZZnHE0TLOoxbUvM4CK3+Dn0BfP2Aoyj+LHiLLqXt0i2eqfzcLmlu0C138qizfNT3Dl5I9
	8/dJIkqkFcURjjpXmpJR2lhtB/X41ixPBe4M6SprbQKh+vEIIIsiSQ0vA1mOR/9Wrj3jLhCHriH
	cmcCUuu4cEEBun27aZUa2GnVfucPKs8v+rnl76XdgYG5W370dQdZEQu70LXIpgfNYD4SKaGcd1a
	/HRR+5u41reqjqSdVOsrKmFCz8197/yslhtmfZgnPah0k9u5dQmhotWBpBsxhUs26/
X-Received: by 2002:a17:90b:2e4c:b0:390:b41a:b92a with SMTP id 98e67ed59e1d1-3933bd0d632mr29846740a91.4.1786984743634;
        Mon, 17 Aug 2026 09:39:03 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4474:5926:fe69:196a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3b3b91sm3029317a91.13.2026.08.17.09.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:39:03 -0700 (PDT)
Date: Mon, 17 Aug 2026 10:39:00 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Jiafei Pan <jiafei.pan@nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	"andersson@kernel.org" <andersson@kernel.org>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Z.Q. Hou" <zhiqiang.hou@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>
Subject: Re: [EXT] Re: [PATCH v4 1/4] dt-bindings: remoteproc: add
 imx-rproc-psci
Message-ID: <aoM5JKcbc4AxoyO_@p14s>
References: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
 <20260812104633.22420-1-Jiafei.Pan@nxp.com>
 <20260812104633.22420-2-Jiafei.Pan@nxp.com>
 <20260813-imposing-blazing-gharial-fbb19c@quoll>
 <80dfac6e-3408-4f62-887d-9da39c827dd5@kernel.org>
 <MRWPR04MB12277AD3869C2AA396ED9A5BA8ADA2@MRWPR04MB12277.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <MRWPR04MB12277AD3869C2AA396ED9A5BA8ADA2@MRWPR04MB12277.eurprd04.prod.outlook.com>

On Fri, Aug 14, 2026 at 07:37:36AM +0000, Jiafei Pan wrote:
> 
> NXP Confidential
> > On 13/08/2026 09:49, Krzysztof Kozlowski wrote:
> > > On Wed, Aug 12, 2026 at 06:46:30PM +0800, Jiafei Pan wrote:
> > >> +
> > >> +description:
> > >> +  NXP i.MX SoCs integrate multiple Cortex-A cores. On certain i.MX
> > >> +  platforms, one or more of these cores can be offloaded to run RTOS
> > >> +  or bare-metal firmware as a remote processor, while the remaining
> > >> +  cores run Linux. The cores are powered on and off via PSCI (Power
> > >> +  State Coordination Interface) CPU_ON/CPU_OFF calls to the firmware.
> > >> +
> > >> +properties:
> > >> +  compatible:
> > >> +    items:
> > >> +      - enum:
> > >> +          - fsl,imx93-ca55-rproc
> > >> +      - const: fsl,imx-rproc-psci
> > >
> > > Hm? So you just ignored the feedback?
> > >
> >
> >
> > Ah, you just did not bother even to wait for my reply!
> >
> > After three months after my review, you send reply to my comments and
> > IMMEDIATELY you send v4 without waiting for me to address them.
> >
> > Srsly, if you have three months, then don't you think I deserve more than 1 hour?
> >
> > NAK
> >
> > Best regards,
> > Krzysztof:
> 
> 
> Hi Mathieu,

You probably meant "Krzysztof".

> 
> I sincerely apologize for the poor timing. I was not familiar with the upstream contribution workflow — I did not realize I should wait for you to respond to my replies before sending a new version. I sent v4 immediately after replying to your comments out of ignorance, not disrespect.
> 
> You are absolutely right, and I should have given you adequate time to review my responses. I will make sure this does not happen again.
> 
> I will wait for your feedback before sending any further versions.
> 
> Thank you for your patience.
> 
> Best regards, Jiafei
> 
