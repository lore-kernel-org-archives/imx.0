Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483E52E5411
	for <imx@lists.linux.dev>; Wed,  9 Jul 2025 14:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752071585; cv=none; b=g4YmkBKgpTcHN4y2++6ASLqH/OQB0zxFqIpammK2Wnnu5zrr2gOWyS+uepnhcPAopPvYKfqvPI4qUN1euL2FePp8isQqUw60/Ss35nmVkoLeGCf91zgYyv+oZy8T/TXkKCm7g/DPCE2Q5tms9AcbZJHTDHBTz/9k/n9ewOT9OVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752071585; c=relaxed/simple;
	bh=C2wCAxa5FvH06O82029Gnip2a4XtLbwPFts3mlei39U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dprZFv+GrfnCPkEr0stpq3jbzrcwdUlNmR+LD/RZjtSuOMZnwtCbBaRzlpGuf4DCzSzlDF2OtF9NQmGEBllomG28m+HesmaSjYX/KEgvw8l1TzgtXQ5gPPWCb+pr+eQKm9n42a8tL1byFaV8b5LnUQTmd4mKEDxwSsuBzFPq4A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bIxkCFSJ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bIxkCFSJ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-748f5a4a423so3324571b3a.1
        for <imx@lists.linux.dev>; Wed, 09 Jul 2025 07:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752071583; x=1752676383; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w6DigU3ijEN37mFImpuvJY0cN+hiwAZNGwYyYKGr+K0=;
        b=bIxkCFSJYFQxWGG27jnKlw1DSS7W09i1ogH1UgixonPPE/FswgS7Sl/E1V7xNg2XU8
         19oXBJmnIBIWDKxxK1NURoaDFsJN4I8JbGKbL0C5UElI/PGUse+3Kg0bznAkgot/7M22
         ln0TlFUYqv6K37NV5O6XxJK+Y98Q+c9oYyqyWCOp00XBK/dXmzVbwtSYzCanolcWi9jb
         y9q51J4wr3r/tQ2Rd2BqIkSqhSRjDd77kj4n7JGmjV01DSUibqDHOt+NsjS9cwy9pJ5h
         uGc0Zd35a0yqktnGXxXNt548k8B2qPZkpHK3U7QJ9kDHCN6JKNL8TesABWl1PZABGtu6
         ci4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071583; x=1752676383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6DigU3ijEN37mFImpuvJY0cN+hiwAZNGwYyYKGr+K0=;
        b=Rb2omfO5CQQRMYHz600OrSv7s2r7j+lcve67xAxbTTPe+82wYoAn0xTBd8X7atwx2V
         J/XSjf22OspOdM2hA8Y9j1aJ+bL8Y5BF5MtPrSlk6DJQWYqS6bLLUlhI1+Xg+QPDuDCU
         irHzZO/CudIYbYq9Cahqp847PT/OAyjV7DArkkidybwU2LmmB6nQKuCyZj82hLNWiscc
         JZRGAoHgN7s4gByGQw/3DInl3jjocFavYmgkiqoxQZ2TeNXQcvJOJb1UQhSQBqddUSwO
         es9epGFENkir6AaGow9/FvKr6dCGFxy+G2IPnikMk+pByzjDKaeYahxkk9FGvo6fCmyZ
         dLSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe8iTcUm6bY9KO9Fmq/+Xa/K4yuN6Y0yS62zIjOyDFnLatk5PKMx+FVOrB5g7DmksZuEk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmMyC4Mb9AD9twqejVkADIoBK5/UOXzVq1mpfGcpUnywLDgYYs
	svIqpbxMl+sUDISd2OxTtGqEH5x1MlqdvfStprMwJL1PvskuNyQUdy9OXbc35KRHtEM=
X-Gm-Gg: ASbGncuM27Hlg2yBFRorBU4BZ5oXkUddTzpgNlU1+wGEGtBGHxOIQOVY2569vPkz+Uh
	bNZKdDj+MddmTbrj/Y24SIvSxFQoFTQI5bKXO6RL5mgBDdSVVHzqkr3rDWt5jU1Mw2ZHx8gTQJv
	ZQJ3xf1b3HU6Sile6S5qrRZxIf6yEzBotFrjkYsFOV1dLhLl76ebFFuj7GadWuAFZJMB02E6raJ
	TLLGU33wu0Rvyrf49tI4Tl8YGQbaFDeC8eRQ1oobgAgVnVtmfuxDSWt0SftXHXtYv5FJs3X1js2
	nWdSYgSO1OQIDDNsS84SjIVsfWf4EGsD5HNqs2u/mNDLeBOZfTbDIh7Vkooo3Xtw
X-Google-Smtp-Source: AGHT+IHb9rJ94x6uyCZzHp4gJ6jJr9aNTPeUN/jkP+tdN5uFfkn31SfgFUorIkoUWVXUVDc9nNaEcg==
X-Received: by 2002:a05:6a00:1742:b0:74e:a560:dd23 with SMTP id d2e1a72fcca58-74ea669d187mr4911450b3a.21.1752071583252;
        Wed, 09 Jul 2025 07:33:03 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:433:ec07:c2cb:e3e8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38f879d040sm13455576a12.44.2025.07.09.07.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:33:02 -0700 (PDT)
Date: Wed, 9 Jul 2025 08:33:00 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 2/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aG59nOSfMuFbJvoK@p14s>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-2-699031f5926d@nxp.com>
 <aG1IIk42q8OmGsQH@p14s>
 <20250709090231.GB14535@nxa18884-linux>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709090231.GB14535@nxa18884-linux>

On Wed, Jul 09, 2025 at 05:02:31PM +0800, Peng Fan wrote:
> Hi Mathieu,
> 
> On Tue, Jul 08, 2025 at 10:32:34AM -0600, Mathieu Poirier wrote:
> >Good day,
> 
> Thanks, good day.
> 
> >
> >On Wed, Jun 25, 2025 at 10:23:28AM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> >> one Cortex-M7 core. The System Control Management Interface(SCMI)
> >> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> >> Manager(SM) includes vendor extension protocols, Logical Machine
> >> Management(LMM) protocol and CPU protocol and etc.
> >> 
> >> There are three cases for M7:
> >>  (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
> >>  (2) M7 in a separate Logical Machine that Linux can control it using
> >>      LMM protocol
> >>  (3) M7 runs in same Logical Machine as A55, so Linux can control it
> >>      using CPU protocol
> >> 
> >> So extend the driver to using LMM and CPU protocol to manage the M7 core.
> >>  - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
> >>    has System Manager.
> >>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
> >>    is fixed as 1 in SM firmware if M7 is in a seprate LM),
> >>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
> >>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
> >>    Whether using CPU or LMM protocol to start/stop, the M7 status
> >>    detection could use CPU protocol to detect started or not. So
> >>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
> >>    status of M7.
> >>  - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
> >>    the M7 LM is under control of A55 LM.
> >>
> >
> >Thanks for the context, it really helps.
> 
> Glad that helps.
> 
> >
> 
> [....]
> 
> >> @@ -592,6 +637,38 @@ static int imx_rproc_prepare(struct rproc *rproc)
> >>  		rproc_add_carveout(rproc, mem);
> >>  	}
> >>  
> >> +	switch (dcfg->method) {
> >> +	case IMX_RPROC_SM:
> >> +		if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
> >> +			break;
> >> +		/*
> >> +		 * Power on the Logical Machine to make sure TCM is available.
> >> +		 * Also serve as permission check. If in different Logical
> >> +		 * Machine, and linux has permission to handle the Logical
> >> +		 * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> >> +		 */
> >> +		ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> >> +		if (ret == 0) {
> >> +			dev_info(priv->dev, "lmm(%d) powered on\n", dcfg->lmid);
> >> +			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> >
> >This is set all the time imx_rproc_prepare() is called - isn't there a way to
> >set it once at initialisation time?
> 
> Yeah. Moving this to probe path should be ok, such as in imx_rproc_detect_mode.
> The drawback is M7 logical machine will be left in powered up state if
> moving to probe path before user starts M7 LM. Leaving in here means M7 logcal
> machine will be only powered up when user does
> "echo start > /xx/remoteproc-y/state", but needs to set
> IMX_RPROC_FLAGS_SM_LMM_AVAIL flags each time do preparing.
> 
> If you prefer moving this logic to probe, I could give a try to move
> to imx_rproc_detect_mode which is probe path.
> 
> How do you think?

Just leave it where it is.

Mathieu

> 
> >
> >> +		} else if (ret == -EACCES) {
> >> +			dev_info(priv->dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
> >> +			/*
> >> +			 * If remote cores boots up in detached mode, continue;
> >> +			 * else linux has no permission, return -EACCES.
> >> +			 */
> >> +			if (priv->rproc->state != RPROC_DETACHED)
> >> +				return -EACCES;
> >> +		} else if (ret) {
> >> +			dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", ret, dcfg->lmid);
> >> +			return ret;
> >> +		}
> >> +
> >> +		break;
> >> +	default:
> >> +		break;
> >> +	};
> >> +
> >
> >Please put this in a function and get rid of the switch{}.
> 
> ok. Fix in v4
> 
> >
> >>  	return  0;
> >>  }
> >>  
> >> @@ -911,13 +988,41 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> >>  	struct regmap_config config = { .name = "imx-rproc" };
> >>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> >>  	struct device *dev = priv->dev;
> >> +	struct scmi_imx_lmm_info info;
> >>  	struct regmap *regmap;
> >>  	struct arm_smccc_res res;
> >> +	bool started = false;
> >>  	int ret;
> >>  	u32 val;
> >>  	u8 pt;
> >>  
> >>  	switch (dcfg->method) {
> >> +	case IMX_RPROC_SM:
> >> +		/* Get current Linux Logical Machine ID */
> >> +		ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
> >> +		if (ret) {
> >> +			dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
> >> +			return ret;
> >> +		}
> >> +
> >> +		/*
> >> +		 * Check whether remote processor is in same Logical Machine as Linux.
> >> +		 * If no, need use Logical Machine API to manage remote processor, and
> >> +		 * set IMX_RPROC_FLAGS_SM_LMM_OP.
> >> +		 * If yes, use CPU protocol API to manage remote processor.
> >> +		 */
> >> +		if (dcfg->lmid != info.lmid) {
> >> +			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_OP;
> >> +			dev_info(dev, "Using LMM Protocol OPS\n");
> >> +		} else {
> >> +			dev_info(dev, "Using CPU Protocol OPS\n");
> >> +		}
> >> +
> >> +		scmi_imx_cpu_started(dcfg->cpuid, &started);
> >
> >Function scmi_imx_cpu_started() returns a value that is not taken into account.
> >
> >> +		if (started)
> 
> I will update to "if (started || ret)" in v4, with ret assigned the return
> value of scmi_imx_cpu_started.
> 
> Thanks,
> Peng
