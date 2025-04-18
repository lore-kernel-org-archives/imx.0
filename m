Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB983E555
	for <imx@lists.linux.dev>; Fri, 18 Apr 2025 13:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744983456; cv=none; b=WvWOX8aUC6NjjRHVrg5HTai917r2FowVO77cQGBHzTDwPAd5O6fNeXN1+iodGf9CAgm2d3gtLmcYZ1WdidcK/hoROd7d4fK5JfrkXcYr5GFvfJa2L8DEIj3CgG7ruYwpruyP+PwD11yOrvxW2qgkKDr+0QdVc/NkSwCcOzxvpVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744983456; c=relaxed/simple;
	bh=Hxo9zaOPkXdZykBjxIAn9bbpS7iZhDxl9xQqQQ8hkng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRrvhERF+klALsvz5ZIT59uCewjbygctVy2KPJvcdr8763hyNFLGGl7Gbhr5nuEqeAGzgPE8YlM+47kKga+VEzn+wfJrUB+IAFNplYSSeyZzCSjI3fPmiS9tM/0PNtX5UssVbGpXG+cRRDbaiN4cCQsUjUKdrdC+bqbM23jjDWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzQG5VDM; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzQG5VDM"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac3f58b9156so18439466b.1
        for <imx@lists.linux.dev>; Fri, 18 Apr 2025 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744983453; x=1745588253; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yaVB0jzsgxgFF8kGT+Ni2eZz8vIf7WxRo6XWKmn6f+E=;
        b=EzQG5VDMilOvAUJxt3hSl3PRqwddVV1bZN/3B8aXsjVdGpV2XXOaMqe237dAFGecka
         r++C2kU8Z0nAMuvQ4CQQZJ0AaVz8QlYb5ADokNWMv9HI3WsPzYu+UlR9b+sshuZDeGWe
         I+mNsYCAv+dbVo1E68jbetwnuYqZQyse8iTy7UD9Vnlxhw36TdocqLeCghRTDOau+Hrx
         0iIGfwwY0bz0tRmyyYG6HfERR+OikkMKDrK5DLRQT8rFreKebSWV4JfKBaLKXcmoZt24
         WmAlwciBnZTE6/71CS6ooiUcQcDC3MjJuy4wQJypVPvBjVZ2yhxFSDJrtLaecl/rGEiD
         rQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744983453; x=1745588253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaVB0jzsgxgFF8kGT+Ni2eZz8vIf7WxRo6XWKmn6f+E=;
        b=B1e5MQJX0IMJUJ6m3FYkZo0cNZU2WYkhatYI0n123lFi1AWNJKUOYqwK81/C/nA4zX
         M8fn2Io/Erg5j08n+rcCko35qGYnCeMSsur0oRkYpqGVJpjXteEIJ/2tmRqJ9Gg/mDpi
         KNC0AdBYu6WmcZ19oN7oxkStb/r0UR9kAHQgH1qEnCcjqM1REeMMBedsG+ltOMpkOt7g
         2U8tfY4hcYrdCUJPoGH9xwJU5K82Cr/VN7z6vf6ZfdcyNF7CilrJNgGDwMSLOZaKbrPX
         QTSsRLBrV/4dTIHKuQ+h3QBYVvk76H/MWz4xRkWIYcqETZe6YJ8noOB/Gwd3FirTCcm6
         Nftw==
X-Forwarded-Encrypted: i=1; AJvYcCU+vSs0A71t4GrBvgT1KU7+NEzzSvmcOR2c1yzUL6WTblnew3btowG+bS1LgpPk8vWaXug=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnNALKqVz3H6unQz2fKi7Jjl4H5H+6GCHZSNh+7wSPU6tTePKH
	1M04cESf3UFMWygp505acCyYJ3UqCRTsqHefhFLnZoeAwwYyYNyj
X-Gm-Gg: ASbGncvgxcx10UwLQgvNqRfi8Qa5Lll7/nFNO9dtLFWXzZu8cYxqtXcRlInjubunFbk
	uX43MdrJHk6IPFx8DUeeFy7erkF0jg2HSWzBPDTWoogDMFnOlKy6SxUFkHc9zg4D3wnsGJyKy31
	0YtywevDadK4PscrXO1tL8tHON473FSrAURs1EPUgxn5D7sqrdPSwoSvtKNCJVXqCIpljhMieJJ
	xC5ipMy5xQdftQDLyg2fLw4ncOgaS/ZAr26O/z1CP96pfLWT+fxY4OoZf2LiT46UDWXGMmFC4TK
	85F6cgzwNkGt0anVrynpQzzqz6yiHbM25KqpxE4=
X-Google-Smtp-Source: AGHT+IHDLcatUwVL3iYay48R00vjtUcVAnpAwx2hlm/q6/jMDb5Q5PmviuzfcY6HTPtV69wle8gO+Q==
X-Received: by 2002:a17:907:1c0c:b0:ac2:6d40:1307 with SMTP id a640c23a62f3a-acb74dba1d7mr79825366b.13.1744983452751;
        Fri, 18 Apr 2025 06:37:32 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec4f6c8sm123584966b.64.2025.04.18.06.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 06:37:32 -0700 (PDT)
Date: Fri, 18 Apr 2025 16:37:29 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 net-next 03/14] net: enetc: move generic MAC filtering
 interfaces to enetc-core
Message-ID: <20250418133729.ul4ocm6ie7b4my3y@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-4-wei.fang@nxp.com>
 <20250411095752.3072696-4-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411095752.3072696-4-wei.fang@nxp.com>
 <20250411095752.3072696-4-wei.fang@nxp.com>

On Fri, Apr 11, 2025 at 05:57:41PM +0800, Wei Fang wrote:
> Although only ENETC PF can access the MAC address filter table, the table
> entries can specify MAC address filtering for one or more SIs based on
> SI_BITMAP, which means that the table also supports MAC address filtering
> for VFs.
> 
> Currently, only the ENETC v1 PF driver supports MAC address filtering. In
> order to add the MAC address filtering support for the ENETC v4 PF driver
> and VF driver in the future, the relevant generic interfaces are moved to
> the enetc-core driver. This lays the basis for i.MX95 ENETC PF and VFs to
> support MAC address filtering.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
