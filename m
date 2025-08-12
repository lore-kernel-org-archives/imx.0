Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F8961FFE
	for <imx@lists.linux.dev>; Tue, 12 Aug 2025 18:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755022644; cv=none; b=VFrauyuXyBha6f94ZJoUI/Ith/C/wv41fCYbvIwgqHJy8/4LbS6oDasYBEVVX2K912JESKmj/q2ASvaRFRzyQwDWK1IvD1P2kjs3o/UtK9NEWRp/ljTaUVnNS9Difvt+06thbQjirN0k+TJTU7JfihR9nCn9gTUFymalSjhMvlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755022644; c=relaxed/simple;
	bh=EMvQd3d1WlKkMgyYl6nmwZf21rQLaUhdMd88yyw2ml8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJF6EH+LmTrTGIvW5utq5VPvom9ZsvSIDMw3gQOTN1Qlwexng6t32SmkRbAetZb5f6GaH/vof1er41k73s18Qy1OGNPkZViBZYrGvnkzMqndmZ9b/wY/qRL/Y8U2K8dmOgdux6hSzSgMTOhT+U/AHpmTpdhoKvYE0djKvRdaX70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=G7sMDTrb; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="G7sMDTrb"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-31ee880f7d2so6583746a91.0
        for <imx@lists.linux.dev>; Tue, 12 Aug 2025 11:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1755022642; x=1755627442; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMsriY29YvNF5zAGx23oTqCNdYx68Xnkyo51DYe24q0=;
        b=G7sMDTrbd+sCM/tTqEvaminZHhrEWRO1SeC4DZh2fRhjsFT1MzZZIa/nzm72YObK+I
         0WeXVqaaC7gLw4qdSUVWUkDJty1LyRrVrlDi3qR40eLgYaJRBS6h3lvw7ulg2YmcfJHS
         svvsf6RpHBpPfR0jQMlqsnFVcm0cjpuOhe2+85UhV67HOE2cC4/Jj5GJOxRLXNxobpSt
         U9bDBvsUKRNa/chTsf1bziGfh222NwaNgMhJRwuM+56dV0eDsCO258mhLj3fuzzrtV/I
         OUfgy6ud4D6EhLC1wYZEgGG9HAu62SkQ3vemekPkPwtUKmbAK5DHiTFlPcHFQMYeXzVE
         wWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755022642; x=1755627442;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SMsriY29YvNF5zAGx23oTqCNdYx68Xnkyo51DYe24q0=;
        b=J3W9b3sLwIQnepCTSx3Fc8VrEEL+ksQpS4MEFcOJA2o+G7Owx8iBlLMXOFCeLaZGKs
         Os5B0ZH4AHZLWi832YgiUk+MgsEaL3WvuNEhoc2aONjHP4R7dD91rb8nCP/kwxe5RIki
         WRVSC7CvU+vB9+1mtnahy++11JjPa6F4bfxT7dvFlLD/ST7eWVuynlrmYOba09n7hVg/
         uWNb9xL3PgjFLT4DtCtKO4TNqGTOagBtOv8bwpCNI2UhoFOf6LI+gAGsVNu/4lE9BSRB
         gxcEFdlw14lL1d0uD/Uo04iJTNngdLR2DjyCL/GCvQbjcTyrFnwEfQsp8PLINIEBsxGn
         6Tog==
X-Forwarded-Encrypted: i=1; AJvYcCUDV2l6k8S+d+KnQn4NaIN2OUwGaCSq6/0sW2NArBECUa+CLl5TonAuSdrWvSg8tDB+YYM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTmEFQTc+uGK46LYr2O8pfqOalA4Ns00KxNv+LFoAO6Nvk9Ehg
	3gujA22CL/HAghrlXoSes+IZT+ZGzKDwAHAq/Kq5ZfO+knbfv5x3ViZrpVP+FAaqyLk=
X-Gm-Gg: ASbGncuhU8FsLnDohq0l/BE54mHoUOtOCt4EXdu0q656pzMY06pO2Xa5cJMYM1Ivn5r
	MxpAlzbfPFyQNe8IgYgZViXvRrA5bBiYC0a3nW2pXJQ0FnOdozeXv9Nqqf0+Yc9B9L8z+J9RHTp
	WplgO0zpYu504aYMhqHwr+JEPpT8G1AmLUIMSbMBgx/lUS+SYLsqW7pkBGOxcmLuWxa0dKoLZRj
	RSpq4nkQuHXuNJfJR/qNK3oOnfb7hxlPFUUpgpbdxGf36W+MXVLZpSErcQmtN7jlA49Pf/+6ISM
	fwogOwvjKxIDaxCLd4s2DfEJOhtHALjgOT+iAIBJJtmEiqFlSEfXBhYIWduV141On6qwrFqKv0c
	h70fpQMhZne/9Oft6OvUkAMsI0bzEjdLnQEN1zY3YJ2ByLGbrzvu1ox3m8zo0hRCbdlSvu3Ik
X-Google-Smtp-Source: AGHT+IHNhWzWkwRf4t4T8nX0GvXq0IE7nZzVv4i5678hX4iND6uqFIFh5YX2G/IUawi7Y4lWCYrvwA==
X-Received: by 2002:a17:90b:1a88:b0:31e:ec58:62e2 with SMTP id 98e67ed59e1d1-321d0e6d0famr45436a91.19.1755022642311;
        Tue, 12 Aug 2025 11:17:22 -0700 (PDT)
Received: from MacBook-Air.local (c-73-222-201-58.hsd1.ca.comcast.net. [73.222.201.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321611dd694sm17922432a91.1.2025.08.12.11.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 11:17:21 -0700 (PDT)
Date: Tue, 12 Aug 2025 11:17:19 -0700
From: Joe Damato <joe@dama.to>
To: Waqar Hameed <waqar.hameed@axis.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	kernel@axis.com, imx@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND net-next v2] net: enetc: Remove error print for
 devm_add_action_or_reset()
Message-ID: <aJuFL__jLySvTNIp@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Waqar Hameed <waqar.hameed@axis.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	kernel@axis.com, imx@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <pnd1ppghh4p.a.out@axis.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pnd1ppghh4p.a.out@axis.com>

On Tue, Aug 12, 2025 at 02:13:58PM +0200, Waqar Hameed wrote:
> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> return the value instead.
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---
> Changes in v2:
> 
> * Split the patch to one seperate patch for each sub-system.
> 
> Link to v1: https://lore.kernel.org/all/pnd7c0s6ji2.fsf@axis.com/
> 
>  drivers/net/ethernet/freescale/enetc/enetc4_pf.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> index b3dc1afeefd1..38fb81db48c2 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> @@ -1016,8 +1016,7 @@ static int enetc4_pf_probe(struct pci_dev *pdev,
>  
>  	err = devm_add_action_or_reset(dev, enetc4_pci_remove, pdev);
>  	if (err)
> -		return dev_err_probe(dev, err,
> -				     "Add enetc4_pci_remove() action failed\n");
> +		return err;

I looked at a couple other drivers that use devm_add_action_or_reset and most
follow the pattern proposed by this change.

Reviewed-by: Joe Damato <joe@dama.to>
