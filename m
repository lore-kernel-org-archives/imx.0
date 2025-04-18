Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3578202C39
	for <imx@lists.linux.dev>; Fri, 18 Apr 2025 15:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744990884; cv=none; b=HC5yngR78srBvPfKwjejzEBHpc2cZiDG+X1AbXtkdAH3Q3mYBXo4xWJ/kydYImBbGaIvFlnajanMW/ykOMheYRad1cBgja5l7B5EofA0mvcd9jauO2CqCmO2KYKMqo4inBG6N+ncd216AoMoYEwPIIuaPAQNkIJ2lASoNOVnFYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744990884; c=relaxed/simple;
	bh=Ei4hL6/iq+Fcex69xWAqM/CXlKvWLYHQG9EDDXMJvik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpNnYExIL24TkuhWfZ1TtINiyAHWQExZDGzEjeRWViIhpYnc3QQ1aBE/YV7fpmUC3veOYruRFBzXUx4r4HMQFaySwqLQhy6mJzd/aUyd97oUvR0KmhkZ92o16VqXyUGqGgs0zfr6OjvSUkNAfkAj4N5yL5M7/obNyGGz0AnnlYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niSshXAF; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niSshXAF"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5edc468a7daso301152a12.2
        for <imx@lists.linux.dev>; Fri, 18 Apr 2025 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744990881; x=1745595681; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4/cWTo90FQUpqjGK8y/mmDlFDVu6Jy0NFCw7BclObhA=;
        b=niSshXAFY9ODAmnPFHyomm7TVQlNKECrI0ZPSvCbMLN5kZ18vrW28tKCVuNkZflpwB
         gE87I/pMDOkTiyBqvJHL7bigwuOK+tL3Nf5aORf3dVIJUYb0mZSSX+vK1tz2Afsrfkfm
         txyOjQup+u3hgzDJ4JXjBF1yFYzoN6MR6RejHHKHGS6whlUUnjdfUQnrfgOzRK86CTLE
         GgmF0FdjzC5UmBEdRmgtbv9c+rmvxuoSadUloiRnZFNk3E7cd1IcN878VObY06LKtEfp
         Z1pKMdAleOx5Eflmre8rCOLcGC0P3c4q6rDJS6Wxol8gF7q4cPjDLsF3PQjBPPQXviJy
         2ZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744990881; x=1745595681;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/cWTo90FQUpqjGK8y/mmDlFDVu6Jy0NFCw7BclObhA=;
        b=q2g+Sq2tpoZc2FoFG3pUCPiGH9xSsjtibKqY2USlG6AxIhvb5tAXrYKo8hy/D0OcrR
         mj31fH/RaTpaQv5yki7dvWruUOrvgxAHW0238woDUWW1tniETUsiWmLVMkNrb0aywP4t
         jg7mTL0uJoILa4EC9XkUUL5NA5tEa6MZOrR3keNmWeh3HSsjlVViLrAJrfcN+TCO645K
         APNfLyk7W3ABwWTkTy+yqEMcQ6huIxMbsdje8BjfsOmNXHyGcELCxGG2iLetefTbVimi
         5Ggpe48gx4cCVd9nMTUY+ezwQaM6b2V4xFjH2wM41kC21IkoxrhD+CNlo1p2VmlgzPWP
         XcHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy/W70YSfk382mKl2l9DwlK6c498zSPs51FZucVC6Q6E/2TFlw6iAQ1ksG8IbhGu+Mr2A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg+FGfWh2y0WeQhrAjbtSXVAMTfk/yHU95dxroJgZ7ZL0mloU/
	uElw0eAg1QNT69wC3PO/PH9LyolFyclnQfjjk6Si1TQpq9CJrtaR
X-Gm-Gg: ASbGncv7vZHe533sPFDAzY2kl9+jnHSPKHqUlB8hP8IdOwUJ0OHGgJICmUeQ5ocrQhG
	GfIiPMI5LNy1QVyIZgvrSLVrFarAeIIB3G4zbt7Io8Qb44cEUPGwApmN2OgcjyXZh6y7+Az/ufX
	Wo9MDc7bzfZpZaiiUz3YQu1GwtvRvLSaXj5fD0wQFpVx06qfZvSIQ1kWeohwg7vGqsHn8KZ45XV
	iPNTURO8e47twV2iMu6pmTClTvd1k8CQo3NMeqlfcynNrrErDYLMPZ7P8AjBkiEw4C94haeY6Z4
	Kt7IuBDc91k2Ch9eg3TRygTTEZuD
X-Google-Smtp-Source: AGHT+IEkRAOdwHdMRa6d2QlCY5Yrw6uQ9t0434Mw1NfnH0yIfWXjkcyamqR6CUsapH+iG9W1uhu/lw==
X-Received: by 2002:a05:6402:4301:b0:5f4:ca86:916c with SMTP id 4fb4d7f45d1cf-5f628524a18mr946596a12.3.1744990880873;
        Fri, 18 Apr 2025 08:41:20 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625595590sm1128785a12.41.2025.04.18.08.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 08:41:19 -0700 (PDT)
Date: Fri, 18 Apr 2025 18:41:17 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, christophe.leroy@csgroup.eu,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 net-next 04/14] net: enetc: add MAC filtering for
 i.MX95 ENETC PF
Message-ID: <20250418154117.jcd6xxnwot4nmhek@skbuf>
References: <20250411095752.3072696-1-wei.fang@nxp.com>
 <20250411095752.3072696-5-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411095752.3072696-5-wei.fang@nxp.com>

On Fri, Apr 11, 2025 at 05:57:42PM +0800, Wei Fang wrote:
>  static const struct enetc_pf_ops enetc4_pf_ops = {
>  	.set_si_primary_mac = enetc4_pf_set_si_primary_mac,
>  	.get_si_primary_mac = enetc4_pf_get_si_primary_mac,
> @@ -303,12 +489,55 @@ static void enetc4_pf_free(struct enetc_pf *pf)
>  	enetc4_free_ntmp_user(pf->si);
>  }
>  
> +static void enetc4_psi_do_set_rx_mode(struct work_struct *work)
> +{
> +	struct enetc_si *si = container_of(work, struct enetc_si, rx_mode_task);
> +	struct enetc_pf *pf = enetc_si_priv(si);
> +	struct net_device *ndev = si->ndev;
> +	struct enetc_hw *hw = &si->hw;
> +	bool uc_promisc = false;
> +	bool mc_promisc = false;
> +	int type = 0;
> +
> +	if (ndev->flags & IFF_PROMISC) {
> +		uc_promisc = true;
> +		mc_promisc = true;
> +	} else if (ndev->flags & IFF_ALLMULTI) {

enetc4_psi_do_set_rx_mode() runs unlocked relative to changes made
to ndev->flags, so could you at least read it just once to avoid
inconsistencies?

Speaking of running unlocked: if I'm not mistaken, this code design
might lose consecutive updates to ndev->flags, as well as to the address
lists, if queue_work() is executed while si->rx_mode_task is still
running. There is a difference between statically allocating and
continuously queuing the same work item, vs allocating one work item
per each ndo_set_rx_mode() call.

In practice it might be hard to trigger an actual issue, because the
call sites serialize under rtnl_lock() which is so bulky that
si->rx_mode_task should have time to finish by the time ndo_set_rx_mode()
has a chance to be called again.

I can't tell you exactly how, but my gut feeling is that the combination
of these 2 things is going to be problematic.
