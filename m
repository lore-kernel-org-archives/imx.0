Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBCA2D5941
	for <imx@lists.linux.dev>; Wed, 22 Oct 2025 17:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761154893; cv=none; b=YSkTDjVB5i/RkNzf7QEsblytwCUD7pIC8T8O+SKaqDwSY7MZq8fyeNxIdwdpNIJ8McycWWbp+TVjttpJyD3367+LhhboSER7quc2fM4ieNiRhNW0ql1FuxT2IYzsohm6dhru1kP+E48yr+Q5Zx8H+N/V6rCbCpXEeTz5qvG0dtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761154893; c=relaxed/simple;
	bh=HLBPhheU6Sdkv+wRlRlVzbDRgyBTZMrIiQW9rt4vggY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=II5roxtH+RPEzD3V1YApGSQxreKbabFCEwpD9n1qcsTh/KQsR2b3xKeZlaBPqTMz4pxVgtXNAnIsHtE1OC8l/PMoVeJ96PSXa9GCMi+dZRK7KZf8WlnYarFSYJuNWqdfm5ENu/kJzWmkxFT2mvdyEDX3YnoCtIdxKxeXlMsnnhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mvW+bi+z; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mvW+bi+z"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-77f67ba775aso9171308b3a.3
        for <imx@lists.linux.dev>; Wed, 22 Oct 2025 10:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761154891; x=1761759691; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H/yVbcNYBKxI7HZmam8giV90V8J7uwfsDvse/7ETWpU=;
        b=mvW+bi+zBxvy+9zo0mLoEdM5W+s34Apxk0oCLGL0/8Yz1M/qmxTTaK7Hu/OEWra9Po
         lKc3HNTEwRsCQJLrMBAaxml8grqbOhOs4qRBrmhx1cD0F2VOoAzAfCFTl00HCu+z0RcB
         Xn3F6VQ9Kt4eyA0u26LsgQ90/7uBfYD+JExy834R1/iG7v4pbHApXIj9DhM85vw0tEPW
         xC6vS5LltcLUwpGI8Hw4IWgt6J3r4nFtQrcL1cOORk9SwPOG84OzwMkamlGJCAA+RD4u
         n0SkJjf+OKfY03M5+9COCxWSuw0XYH1eTQpq89XQuoErE9iuthifQh8E/HyIL201gRMk
         VZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761154891; x=1761759691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/yVbcNYBKxI7HZmam8giV90V8J7uwfsDvse/7ETWpU=;
        b=nzzU9ZfqqSdXMaIB0Oq5355apFPEJeqUt6FtsZaHcg0jdJUbDqOonUT9kvSg7UGP7N
         S/NtVEB0kLnsCq/oTGEfidxBXUGzRKugSiRud+KoEH+5HZHz6SrWSh50NSdbhH9m0OkF
         tbgny+QSWbpI4k71tWGExBUWkDMerfNlC3DUbO6YBXmWXyGLVaheTNYU3Xqu0ezmg30F
         6vl8gUyBWrvToUdMmvgur443TCUWi3QpzIH6NFdDszy1ER+WAwb3uvuhT+dgKrjS4VSy
         44Ehw3avNvTFWxzvYO8bTW11nGuJOIBiEzv+/2PtUBGEk5FigoSUX7cMy4Tt/S6oZ4FK
         deEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj6JGCz6TMu6wvjN5PWrktDa5eRYfQba3ovIy2IZRLYH133XtH2HsIKJXMdrfmO4zZjyo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwLUwpBxRSQAI9VNwfQn8YhSX3wOaSGQGbszM573PHAe+3t6e1G
	tnsejXY9ui/Du5Vr9Sig1zelp41J5XG7YcRo6Dp5mahGTz3TcEGMA+v8RszkC2dsCjk=
X-Gm-Gg: ASbGncsbva/UralLlhsA4gHIvPYHoneBYdDUnAcm64ESnNGki44kld0yvIcsS1p2xjx
	NH1GklROxrWd3zSyBTy5ytHg3QmQcEagIrSJ8KbvZp4b3KZsKIU78pXYEGB0dlbZZdTpvYhJ2tn
	3vKyaElkeeFimaBAcJLaEkmlXFRBa1iWBaZU+0zgdVnaDx3rOKyzvDlzPTvCZngqKtDFkbS5TMh
	H6ioVXyOC92bxv4nFO1GLIS8uzP4LoITPBHhX58+XAK/Vja2bEbih7QOKsKbbdmRbZhToDJeuub
	G8R2NihEJ8zVqCMbu3kw3/zRmniVaIESSYIgZ7O4Sf674tITvtOkTGBTfXJ+wQoUtJWEuqQqclm
	WeN9erjA8mXrhzhnS8Zk503R8oTQkq3LBrV7epUxci6oVJ6sqnKFLtoCQ5D8lqxBdWm3z7ASo79
	TlZgaNZT+nf7E3BQ==
X-Google-Smtp-Source: AGHT+IHjwdJFhyPffGM4FBkB+w0a69ezxil2LnB/hHwjzMGVo9Ioll+93XMe3fLrl1LPLka9UTkijg==
X-Received: by 2002:a05:6a00:9a0:b0:771:ead8:dcdb with SMTP id d2e1a72fcca58-7a220a7e712mr26747780b3a.8.1761154890617;
        Wed, 22 Oct 2025 10:41:30 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7843:84f1:e4ca:d99d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff39654sm14983897b3a.31.2025.10.22.10.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 10:41:30 -0700 (PDT)
Date: Wed, 22 Oct 2025 11:41:27 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] MAINTAINERS: Add an entry for i.MX remoteproc
 driver
Message-ID: <aPkXRy7TsPCrq_s-@p14s>
References: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
 <20251015-imx-rproc-c3_1-v3-5-b4baa247358d@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-imx-rproc-c3_1-v3-5-b4baa247358d@nxp.com>

On Wed, Oct 15, 2025 at 09:52:59PM +0800, Peng Fan wrote:
> Add an entry for the i.MX remoteproc driver
> 
> Acked-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c9cdb95dc150a55df405adc3cb853c61f4c2b467..02dea709a5a5d591f156becd35640dfd93fe62e0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18610,6 +18610,15 @@ F:	Documentation/devicetree/bindings/clock/*imx*
>  F:	drivers/clk/imx/
>  F:	include/dt-bindings/clock/*imx*
>  
> +NXP i.MX REMOTEPROC DRIVERS
> +M:	Peng Fan <peng.fan@nxp.com>
> +M:	Daniel Baluta <daniel.baluta@nxp.com>
> +M:	Shengjiu Wang <shengjiu.wang@nxp.com>
> +L:	linux-remoteproc@vger.kernel.org
> +L:	imx@lists.linux.dev
> +S:	Maintained
> +F:	drivers/remoteproc/imx*
> +

Here I am suggesting:

M:	Daniel Baluta <daniel.baluta@nxp.com>
R:	Peng Fan <peng.fan@nxp.com>
R:	Shengjiu Wang <shengjiu.wang@nxp.com>


>  NXP NETC TIMER PTP CLOCK DRIVER
>  M:	Wei Fang <wei.fang@nxp.com>
>  M:	Clark Wang <xiaoning.wang@nxp.com>
> 
> -- 
> 2.37.1
> 
