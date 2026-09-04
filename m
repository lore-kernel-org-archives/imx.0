Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311AB415F22
	for <imx@lists.linux.dev>; Fri,  4 Sep 2026 05:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788500623; cv=none; b=EfVcfIJnk1m7eMBErzuchqrueBAR+1v+af6AKcrqiGfcCOuQMTk+jU7Pxxk/pO++AQGbWcOZtFqIu8NPNsfA6bmQJpSf3cUmjXQLeXPJvYHaMIM2ANjeDxXTBdaBoTi+VJH/EbrRglg6iR8ZblA1un3sqYwhop2aNZ8g0t+TN7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788500623; c=relaxed/simple;
	bh=87tW78USOIRu124aJptnXZ1ORwFWyuAoO45i3VE7Rzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRjRl4qPdFqVywjISlVp0zs17IlWEDKktSkYlJ0ADDdgdzD3cDdjM6Z21JpNUaRuCyQf1u8Xx9mcVnLChQID1pAFAuGKGAUiE5fEzqyotxcriN/gzoRprLK3/YPV2MyczsIvG83ms+yoiHSkuuwfVUj22A4iV95E4u4dWoBZSUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pBzzB5LD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pBzzB5LD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d560775ca2so5286935ad.1
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 22:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788500621; x=1789105421; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XxOcRRnDrKQlx91Y28n3fxGGvoUu/s1bIHpjhY19uNc=;
        b=pBzzB5LD5H6+Ykx+nDtEg3SQ82vR09Uo3Rc8/QQacHthoTAOoFyy+Cjz/wPOFiXqM/
         udKnmHoegc81O/WxC1VVsg3udQO/HPAWP6+t1tJ6Nuffhq6ulOuVYEBxu67U76/WKeIy
         Bw0rnPIKh3jvnrjKwGFffOPr3/yXyKbzSjFYHONvWvuSCf5kuMx7B690KCiLJ/h2u9Ci
         Cr4gf2nIdram2FmYdNZ5KbQSDz2P0SnB+p6Lk9L1tPhy202qMxdiNDsfkFDeqnbie7ev
         NtN80F9HFf7nFCVe/ZOxrzDcbgOPZfYBRqlehAg5hdv74kvnmxqt9ni8//+59L6nKA19
         0tsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788500621; x=1789105421;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxOcRRnDrKQlx91Y28n3fxGGvoUu/s1bIHpjhY19uNc=;
        b=Dq5kj0fkC0TU1kR+aKZ7I6av/rhVN7TyfJoB7K8Xkc5ewlisI8gv85KonCLePw936l
         lcPKRO8vMt1gw8y702OmBAuLXWK0YG1iNced1jvNXrHrJCdIkIdgol1A6bjmZhyLxpnX
         k7hHj8uyRlrEG8aMi+F+86x+j21Zn555Wlytfg5lYoUUnMZt0tqByqSqO9HDZJyI1piO
         aphdyt6YJ7XHG1KMOteUUUJbB1NlsDszGp6/AnZKKC7LbAKX7jk4SbT07ehTl38u89GL
         YCjcxU9gquOzaSMfTuwt3mMYJdVkRM6u+e/1O9Ln0XOHcUedNepdzjxhG3/HVXjhf5QL
         XuMQ==
X-Forwarded-Encrypted: i=1; AKwUvByucPPaJ6ChUJ4Bm0TnXKVmcPgJgIP9k1aZfiSWb3papMG1FHS4VqsIdSJoROsvYanZk2M=@lists.linux.dev
X-Gm-Message-State: AFuF++kwuYVSszUAu5M2TYNs5KBefGXW7PD2nESIivGqLmzgczT8deat
	cU6tWqyAkGw81QXaUhKdc8ZpV+vMZYrgpaNERHlpHkpVKSBmBfBdlTuf/Lc9urnb7CY=
X-Gm-Gg: AYBFou20WHyV3dJiCxWxoTJuxZh0yc1Q3CM25FcxYqQph22P1kKxLCnmEGd4AaBw/PK
	zv9FnvY/SK5BHQc3xeDDMRyScnmeOI/ElTQGZvmc4jUDYahedsOoEWgjKnxZ1nVAkwvHTzsvp7U
	/9W+F7nLbiyqjTvGKuZnZdDcnHnnBzqNWoYgZZgqQkEiDoSzUF598qySjlOzcja6FR6cvXxQcNi
	81YCzL8tfM9AAPIariKgkhPJgLAvop6JbA0bYifkrXTgtRAiUY6hS0px4EN1xQTy9/MJQz1wnOL
	euX8lilmdzUSleyFNsEJ+uD8QEhEzjyqSImFxZlyUrfIK+5d6DIlyt3DoYd80+p0eunFq7HA1fD
	mvvMb151/awNsdDxcfqFRdA4DTNu1+NbrvXMUVqeJBuMWM6tOgdmBEZqvxYFBqOkply2VfxuosZ
	7Hc9we1c66wuONQqB2vm+OW172hxncYdao5wnPASPVOnwKrzeJ87GoFcOKUZ81j8g=
X-Received: by 2002:a17:90a:ec8d:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39b26101c08mr5553870a91.9.1788500621351;
        Thu, 03 Sep 2026 22:43:41 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm3885069c88.13.2026.09.03.22.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 22:43:40 -0700 (PDT)
Date: Fri, 4 Sep 2026 11:13:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v15 2/5] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
Message-ID: <appaikrdwu6GpSGy@vireshk-B250M-D3H>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
 <20260721204704.400781-3-shenwei.wang@oss.nxp.com>
 <apmunD8bkKOu5_Vm@p14s>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apmunD8bkKOu5_Vm@p14s>

On 03-09-26, 11:30, Mathieu Poirier wrote:
> I'm proposing something like this:
> 
>                         $(transport) {
>                                 compatible = "$(transport),rpmsg";
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
> 
>                                 gpio {
>                                         compatible = "virtio,device29";

I would just change a minor thing here:

s/virtio/rpmsg/

This isn't a simple virtio-gpio device, since it doesn't have its own virtqueues
and uses virtqueues of virtio-rpmsg instead. So this may better be a
rpmsg,deviceX (where X is virtio ID) ?

>                                         reg = <3>
>                                         gpio-controller;
>                                         #gpio-cells = <2>;
>                                         interrupt-controller;
>                                         #interrupt-cells = <2>;
>                                 };  
>                                 gpio {
>                                         compatible = "virtio,device29";
>                                         reg = <4>
>                                         gpio-controller;
>                                         #gpio-cells = <2>;
>                                         interrupt-controller;
>                                         #interrupt-cells = <2>;
>                                 };  
>                         }

-- 
viresh
