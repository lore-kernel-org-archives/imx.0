Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807EB1D63DD
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 17:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749749501; cv=none; b=FfAU4rH1mHw5sHmuy+5ITnNl9UtP9PMj8TKOl6mTq/wVYiEuMKuZnXMWZjNJBU5y6IV68YdoEW72jdTKL7kR2jsyWjxpydCpIpCZAeemNstfjzBOhwclEatNggizbMRhiQyAJRgK5vzUvdY2IlfIY3gj9cItL/ftP8i+kpSUSKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749749501; c=relaxed/simple;
	bh=otcnDpD+CwvfxCXPQGJv0FOTQyY9TfauzzsfyruyWCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNnYA73w0JVM2DBuQ19yiUFQNDuCAngPzl2yKXBvBB8q8thTNJOaweHbijbyjKZXvkI0enjWDOog463dMg4Xh1mglC/RM/QEQ3ZukX3Xw3NANg/Nw9UwNonMu/1KgnjcYdIhbbmRX7s3LQWHarixRTjGjV1xBnvvvghybjqySAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYqVsxlB; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYqVsxlB"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so1047465b3a.1
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 10:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749749499; x=1750354299; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xv8y1hwAZ1ADO72IiD5Mm9fc1qZ34wninqrfu7oXtRo=;
        b=fYqVsxlBRm5RGY/27P71z4KZGJBM6qoTT3pg3pFylzFC9aAF462OA0bpWrSvSB7gcK
         PAYj7RjY3Nhs+YV3Gg1bg+zMOkiyQ+uniQwH/ScJt46+Joun4h1+tLWyH7VW6QRFmGyp
         YPRaTgUI/HmVzaf81TOk1weLcNDYorK+F1awQcQBzwV6BxnAUIbA5+52P3ihUIHd1VIr
         yybC5ACPrIfE2ilDY+So0S80aNoqLYeH+3ZINsNYiZwlmbi8p/dK1BGx421O2IcM+SOj
         YxIlVNOSc9wLG10AtmAEW7+Ljmcbe1Iv0vBNFq92yrOf0V+0BeHyY7krwX110S2RPuAu
         RfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749749499; x=1750354299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xv8y1hwAZ1ADO72IiD5Mm9fc1qZ34wninqrfu7oXtRo=;
        b=SP8iZ3yiaybbe4T+anq79zk7AeojzQWPa7+8Qt8wjgwODtml5C2MU1KEr2iuvAQ1gi
         On2ZrVMsrnhxlx+XJG8e5KMGlxJ1KVyYhGSu/ajjqeB7eO6HEQYl5Zc1VoKUtKq0+BZn
         +kgyi+Jh3pmhEdZ00FoI9CLnbKCrxthmqPxbU8AxVQKpkFC5c+G6kTNkcg+LGaymuw78
         NtGlz5J9rj718gd7cY1l1/sv3LntWdyISSN0KKiHPV4XqAqwAwStCMIBy2HC8+8IG/zN
         HxznPxC74D1SZkwEvfSNjJYBC+eV82K+jgrbUHdD4iQQ8mrBp/rS7tYVHgrih9VwzYVE
         HtLw==
X-Forwarded-Encrypted: i=1; AJvYcCUVJDbbZhb5rY3HQE9jhalPDOUORuVOhSPOAfdz39wVz/Vh2D2lkbxu09FPrbjjAkARlqE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6mmE3gJ9gGaf5QMRvEF7GHPRSQk4mNul+fMN5fdDB+L1WGkIq
	Qt6XH7q3He+aZs6CT5a7c8GEoFYZ9Oj33XZvxSheS7RDIAo9+Q+xpg2w
X-Gm-Gg: ASbGnctAoPDoBnhk8NYeq+K9N7qYqi/ji5/Bz/tfQyRNWcXcMhkvccH3DvnLDxTQ75z
	sXdNQHxVMHPxfeM/3sxHlMGDl2TYTgcsiA1YCOuwPifUcl8eW3ECiUbfj4DYlHtC8uIKk8J0bPF
	pmMBOv/XBafn2H4LxZ9B2gIi8H53OV2vM4MqFVwh8yy9A0Mq47dgqtlhpt+Z8p0Kv7ohG7nQw8o
	CSBEzkDOBZFHeNVXLauAVvieoY11elaj+FGXG+EF27Z5B3aNrlkXJ+cNk2bilqw0kkl0phKrVoS
	VfqttDMHDYvCt1ylufvASYZF78otrm6X8Q+q431cmD7Z+8LwVN3jAyYGTNcg
X-Google-Smtp-Source: AGHT+IF6JO6zv2ZxYGrMpFyX5qpBH+K4yTR69s1GLbL1n6QCFkSYxYZgE78yuUZ7Dqsii20VloyovQ==
X-Received: by 2002:a05:6a00:cc:b0:742:a24d:aede with SMTP id d2e1a72fcca58-7487ceecdc6mr3909973b3a.8.1749749498580;
        Thu, 12 Jun 2025 10:31:38 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74880a0bcd4sm1800344b3a.149.2025.06.12.10.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 10:31:37 -0700 (PDT)
Date: Thu, 12 Jun 2025 14:31:32 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4 1/3] pmdomain: core: introduce dev_pm_genpd_is_on
Message-ID: <20250612173132.ixgctqijtd33vnmb@hiago-nb>
References: <20250602131906.25751-1-hiagofranco@gmail.com>
 <20250602131906.25751-2-hiagofranco@gmail.com>
 <iuotfsnaft3623lchzop6sbu5ox56scdr57uia56qm6ummcvzt@yisczcdzbc3b>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <iuotfsnaft3623lchzop6sbu5ox56scdr57uia56qm6ummcvzt@yisczcdzbc3b>

On Wed, Jun 11, 2025 at 10:32:28AM -0500, Bjorn Andersson wrote:
> On Mon, Jun 02, 2025 at 10:19:03AM -0300, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > This helper function returns the current power status of a given generic
> > power domain.
> > 
> 
> Please correct me if I'm wrong, but this returns the momentary status of
> the device's associated genpd, and as genpds can be shared among devices
> wouldn't there be a risk that you think the genpd is on but then that
> other device powers it off?

I am not fully familiar with the genpd's, so my knowledge might be
limited, but I think this is correct, if the genpd is shared.

> 
> > As example, remoteproc/imx_rproc.c can now use this function to check
> > the power status of the remote core to properly set "attached" or
> > "offline" modes.
> 
> I presume this example works because there is a dedicated, single usage,
> genpd for the remoteproc instance?

Peng might correct if I am wrong, but yes, I believe this is correct.

> 
> > 
> > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> > v4: New patch.
> > ---
> >  drivers/pmdomain/core.c   | 27 +++++++++++++++++++++++++++
> >  include/linux/pm_domain.h |  6 ++++++
> >  2 files changed, 33 insertions(+)
> > 
> > diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> > index ff5c7f2b69ce..bcb74d10960c 100644
> > --- a/drivers/pmdomain/core.c
> > +++ b/drivers/pmdomain/core.c
> > @@ -758,6 +758,33 @@ int dev_pm_genpd_rpm_always_on(struct device *dev, bool on)
> >  }
> >  EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
> >  
> > +/**
> > + * dev_pm_genpd_is_on - Get device's power status
> 
> Functions in kernel-doc should have () prefix

Thanks, I will correct this is next patch version.

> 
> > + *
> > + * @dev: Device to get the current power status
> > + *
> > + * This function checks whether the generic power domain is on or not by
> > + * verifying if genpd_status_on equals GENPD_STATE_ON.
> > + *
> 
> If my understanding is correct, I'd like a warning here saying that this
> is dangerous if the underlying genpd is shared.

I believe this is correct, maybe Peng or Ulf can also comment here, but
if that is the case then I can update the comment.

> 
> Regards,
> Bjorn
> 
> > + * Return: 'true' if the device's power domain is on, 'false' otherwise.
> > + */
> > +bool dev_pm_genpd_is_on(struct device *dev)
> > +{
> > +	struct generic_pm_domain *genpd;
> > +	bool is_on;
> > +
> > +	genpd = dev_to_genpd_safe(dev);
> > +	if (!genpd)
> > +		return false;
> > +
> > +	genpd_lock(genpd);
> > +	is_on = genpd_status_on(genpd);
> > +	genpd_unlock(genpd);
> > +
> > +	return is_on;
> > +}
> > +EXPORT_SYMBOL_GPL(dev_pm_genpd_is_on);
> > +
> >  /**
> >   * pm_genpd_inc_rejected() - Adjust the rejected/usage counts for an idle-state.
> >   *
> > diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> > index 0b18160901a2..c12580b6579b 100644
> > --- a/include/linux/pm_domain.h
> > +++ b/include/linux/pm_domain.h
> > @@ -301,6 +301,7 @@ void dev_pm_genpd_synced_poweroff(struct device *dev);
> >  int dev_pm_genpd_set_hwmode(struct device *dev, bool enable);
> >  bool dev_pm_genpd_get_hwmode(struct device *dev);
> >  int dev_pm_genpd_rpm_always_on(struct device *dev, bool on);
> > +bool dev_pm_genpd_is_on(struct device *dev);
> >  
> >  extern struct dev_power_governor simple_qos_governor;
> >  extern struct dev_power_governor pm_domain_always_on_gov;
> > @@ -393,6 +394,11 @@ static inline int dev_pm_genpd_rpm_always_on(struct device *dev, bool on)
> >  	return -EOPNOTSUPP;
> >  }
> >  
> > +static inline bool dev_pm_genpd_is_on(struct device *dev)
> > +{
> > +	return false;
> > +}
> > +
> >  #define simple_qos_governor		(*(struct dev_power_governor *)(NULL))
> >  #define pm_domain_always_on_gov		(*(struct dev_power_governor *)(NULL))
> >  #endif
> > -- 
> > 2.39.5
> >

Best Regards,
Hiago.
