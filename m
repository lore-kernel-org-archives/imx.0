Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D36313E27
	for <imx@lists.linux.dev>; Fri, 12 Sep 2025 14:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757686490; cv=none; b=IEnJV/rT5TJ+cNW6AWWnmFvHJQ7LQkA3tU8jeYPBYGiyyHjVFRUrBqxWKz8d9OwqNoGLYtSM6ln4LRz8/szoH577B+ru0eTDkaJdiK9Zk/UnVOCwXmVRIPL6YpLymPeTlIKsCCDv2SB5Cf/ZUuzpBDjGZagr1BdWrtFlfOtKDrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757686490; c=relaxed/simple;
	bh=9sLEUiKxs4kaq/+VDmR5+jYAXaH2kN70zH8R7UU9LhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnF5GM5F78UlwQ4pdm+oAGE9+Ap0YqpoyHM9r6ryoF5kxsBBxuLQWYwiDRO21Du3bJLLGCNxSrPZEEkIlhOV1SkoTg5+Zhlb1b9PY5s/UUteAp1N3Di4PkPF/XnQYfQ+hlLTd9CxnzpsOEeaya0yotsPAKaEx42ZyZCCllCv8dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hKdirOXi; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hKdirOXi"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-24b164146baso11681165ad.2
        for <imx@lists.linux.dev>; Fri, 12 Sep 2025 07:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757686488; x=1758291288; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KGHsIb+AKMqGJwrQY3RDFxGfsX+pej5gKpzkWT00FLc=;
        b=hKdirOXiE733DHpCLrtX8cxn2FauqpVtsrsouZypZvNNdpzwOm38x7c08OXByZHMPA
         AkuNZY0RQ3gANDWL+wzdKRDITicYfpeNS888FzP+18A88KElJtaVNsNJm87TADMLfHxm
         rf6dB7me32nxIbfdCvofWwMTIxwflrBoDcUxSggUJR68tjsRpql2bKyVva0r0RvUDLnJ
         BESzpcdWwDK8yaGsNLcZTQjR8hVL9vzrDJCRvqnUjYuubROrzhsysB/RBr2APyZTI85c
         go/ss9TV2mCMXqrFIiJjQz9+Do2Y2jilcmWuA8r2fHWkuOke7qNpJM7KVpplzTLCLmpW
         Rt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686488; x=1758291288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGHsIb+AKMqGJwrQY3RDFxGfsX+pej5gKpzkWT00FLc=;
        b=S1K4UoO9khRMerJG2/+KvKkYO1wk8+y0s3K2vATztIHFxoCwaxbdgV1lhfqhsdXdwf
         xWePa4aVq8ZVyhQrE3GbLAbF3cQZhonw5Ctz7/cksx94ZgRp718kooQaJe7VOChIzPCq
         xW/cGr5XCaZnumbbZjDMHTaQ38ANbFyZqZudw3PFLSrOx3hTbfxwIzRJy5FUeMuAAR+G
         PVRzf0Mjv16xRIDTFNTU+zKGC5JDBcxpMlQf6Q6O8Iwbd5VBCHhqzSwibSSYxrj1dDzt
         APXTdkL/cPEhYZ3Mxn8sQU6jjh60u/YEfjd5eIfvmR5vEZvp2ng43ebcj/f558eARjU5
         ezoA==
X-Forwarded-Encrypted: i=1; AJvYcCXvEXMKm2U7J6DFCzKOBU+kUkM0nkouzEqsT0jBe1zzX9iPtEr78vUXsxaH+ZeGzNOO5+g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKSAuN+on50OLMMN+3qga2ceUAZWG5OK0bVq6I3KgsEtSaKjot
	nkpdvmfJSIJSkQsSKIRd942Ag3Q7HXHkApbgXwPDjPUf8WfemtzQpIyNLi6o2WUuNGM=
X-Gm-Gg: ASbGncsW9voHFEpCbIseQgXyZFkCRxL99RFSFo290+2VmIdEyT0AHxF+dG4wFAtk6ba
	n+60mtfAtYctffy+LMcn5JhHlax44J+x6nLFyOX8oyv8AKPOyLwfmCu4PlOHg6Wp/4c0SQ1a5Wm
	EjY8mUHAa/PpwhoEdWpTpZdkPu7dKgsphzV5xoDrTLJBC9b+zaipFMm/d+k77TwWgXxZlUCU4ax
	rEaVaN3JlbxNZ9cTBeaKYD6KHYQvUUvm/I96jV/YuSn5l2k+M60bY4zfjz9tfAYjpT1+gWjyDK1
	uv5gLbWdvXunKYH0iDT+kn/8pJEqG9wq1JpI+XiXlo+EVaYITNeLO8GwHrwWY8eQSra7JjnUH8/
	ujKa9YMFkavVYUfCB71l3q4FKWDN2kpC71ChU+1HH4R2n90yaw8ehaIcaRvblnMR+x9O2YnJ/BY
	UD3QL3qhMHetalyXky3Nozmw3xyZ/ymGczVQ==
X-Google-Smtp-Source: AGHT+IHHdJciNdadW46V/rsCGh0pPpDDjeLfRRykUe33Y24roFNgOG8c9J3Qxo6W5bSrO6GUGaOkXA==
X-Received: by 2002:a17:902:ce89:b0:25c:5747:4491 with SMTP id d9443c01a7336-25d26c4ab81mr39777925ad.46.1757686488456;
        Fri, 12 Sep 2025 07:14:48 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:650:9892:cdf9:70db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b304f76sm49226035ad.130.2025.09.12.07.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:14:47 -0700 (PDT)
Date: Fri, 12 Sep 2025 08:14:45 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] remoteproc: imx_rproc: Clean up after ops
 introduction
Message-ID: <aMQq1SABdOMba_jB@p14s>
References: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
 <20250910-imx-rproc-cleanup-v2-6-10386685b8a9@nxp.com>
 <aMGe/gwmFqjoFszg@lizhi-Precision-Tower-5810>
 <PAXPR04MB8459CABA152B6C1C122B35F28809A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250912061120.GA27864@nxa18884-linux.ap.freescale.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912061120.GA27864@nxa18884-linux.ap.freescale.net>

On Fri, Sep 12, 2025 at 02:11:20PM +0800, Peng Fan wrote:
> On Thu, Sep 11, 2025 at 01:13:59AM +0000, Peng Fan wrote:
> >Hi Frank,
> >> 
> >> Can you remove 'method' in data struct also?
> >
> >The method is used in other places and other purpose, imx_rproc_detach
> >imx_rproc_put_scu, imx_rproc_remove, it is also referred 
> >imx_dsp_rproc.c.
> >
> >Could we keep it for now?
> 
> The method could not be removed from the data structure, because it is also
> used in imx_dsp_rproc.c.
> 
> I have a few more patches to do further cleanup, but that would make
> the patchset a bit larger. I would like to see Mathieu's view.
> 
> Mathieu,
> 
> Do you expect me to add more patches in V3 to cleanup other parts or
> we could keep the patchset size as it is, with further cleanup in
> a standalone new patchset?
>

I think there is enough in this set.  I will look at it next week.
 
> Thanks,
> Peng.
> 
> 
> >
> >Thanks,
> >Peng.
> >
> >> 
> >> Frank
> >> > -	case IMX_RPROC_NONE:
> >> > +	/*
> >> > +	 * To i.MX{7,8} ULP, Linux is under control of RTOS, no need
> >> > +	 * dcfg->ops or dcfg->ops->detect_mode, it is state
> >> RPROC_DETACHED.
> >> > +	 */
> >> > +	if (!dcfg->ops || !dcfg->ops->detect_mode) {
> >> >  		priv->rproc->state = RPROC_DETACHED;
> >> >  		return 0;
> >> > -	default:
> >> > -		break;
> >> >  	}
> >> >
> >> > -	return 0;
> >> > +	return dcfg->ops->detect_mode(priv->rproc);
> >> >  }
> >> >
> >> >  static int imx_rproc_clk_enable(struct imx_rproc *priv)
> >> >
> >> > --
> >> > 2.37.1
> >> >
