Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC8931328C
	for <imx@lists.linux.dev>; Wed, 29 Apr 2026 13:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777470947; cv=none; b=MeuD7j4ygX72YmELakXi5k1B6RfDzIPAO3FejFcFAfjJmTkHNmK0ml1cE29mWTtiRJqeAt8WFk75k0L+QJj2KSRd/3vMMxVfsQyKC6SoueVM60ASsVm3Hf0RStXy1jzNN6E7WYocJHlE3EWmixcjDB4+qrsbnBphD+aPzvWGoU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777470947; c=relaxed/simple;
	bh=buDqtxL5iiA+P59BL7gOogsMTPfTAbw/6u3MZ3bRXX0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FSdy5fA4Lx1znBa+UXZ9Eg8IDROBuTQSmLb0t1YqxPnB6HO/zrsrodYH12fOxP/nOLQx8T42Qv6YI2DWxb3LbcRJ9wCn+rb8gga00Pe3dR8S1YVyoWjDELCFc7gTksHjx/zn5YzDCZ8OLlQ80LW0z7L/ysl2BTtOiAqrEX489W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aaye5le9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aaye5le9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777470945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E4gmtst5bATy4vi+nqQOmDuupzzNRv5w7Vbola4ydK4=;
	b=aaye5le9VF60v6sPq4CiCo/9qzuijopOb5flH3s2LuBRfAMvPzMGoAoqOxQUO0Mah2s6I7
	xZwl9Rt/ndjWlsIfBeDqIBI5tNcIpm5MaQnpq6TY6iuFhvQPjgIjN4ZmdwPGdTCf/gn/hW
	6NQxs60dSSYqLLlGdFhQxLqCDm4jyOA=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-1wGz-JdsME-RVwVaTTTmyw-1; Wed, 29 Apr 2026 09:55:44 -0400
X-MC-Unique: 1wGz-JdsME-RVwVaTTTmyw-1
X-Mimecast-MFC-AGG-ID: 1wGz-JdsME-RVwVaTTTmyw_1777470944
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acb26fbbb2so185130766d6.2
        for <imx@lists.linux.dev>; Wed, 29 Apr 2026 06:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777470944; x=1778075744;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E4gmtst5bATy4vi+nqQOmDuupzzNRv5w7Vbola4ydK4=;
        b=pi+w5cQNBZEFAe2jThpfN/SnpeYO5C0koaF5FgdtS7JgJoopePcVVPQpKJtrHPmMfG
         erYVET1Pax/XDLYT8wZHnR1/NmirDOv3xzZreZD4eL8VtMLRt/leliJFqnzp7NiFaKy6
         3RXUTssXN4VapBfJ/kdTGtR75doP/EQe0myq63kR+cLiiBQd1ST9HnGQ38GPaVdxEhru
         dXEr0tAr94tcPBl7SfOUh8YKyfJVlgZcdwr5Kl/ddlDNqCVjWbZi6yxEW/e42F9NeMCm
         MW5C99foxZySqOCDNbHsdwEhb6CQHNp4f6TsRCZI8sKXxRyjptNsQwbnKLNPojwVHWx2
         +dBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+062/ZIEy36668KvHSHAELxAKZgpEZD1t/7dIiaOA4Mv+oVSjY34onyLH/RnpRNJ+GoTA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzviBqv4Aw3LI+p53DUrJA2r4uc8R5PHIqpyNdg75sq6o3EZ8t7
	8kJaPEhyxAsO/YqHcj4wgPRMFtHTa8aJNRZxkhqh9F6HG3q2pyY5PBs7IaY/AXnxmmntyw9zM6l
	d2EjNikQFG7LjjZyxOc+h6NlDVmRpOqZEAC8oi6jK6A/3VRNhjDhEYQ==
X-Gm-Gg: AeBDieuID5WohDZtl1BMpZeAsdVBkykOOUR7SnseVQg4QfhICS4VnYFI00chIttmrvg
	DTBRKDQnFmXBpr4iD1ovMSjo8CjifUZoRljYa509cy/n/+232AFfMaf0MJ6yoppqcD+xYUie3kP
	S824gaUuOIqwhH9KdOChf3+KrI5Eu9LQzp0cNo67CZcwYXLjo5P3VsNrrouiTXImNTdVHpDGRat
	z9yOAfK661ytjnCxbbThIGmlRcYx65+9TF8fesk/DHC4mXo5QgOHBgYQhzvYOR1bjbLiuT3S7vM
	VuKaRiojIBUE6GQnMshXof183n2GYT8r+UK7g+04BKp/2Xtsm3wzFxJoeYe9zWobBADDLs3e4EM
	N9KXYOs1IhCy2YXz/LU0/QXkPNSHtMR+5RANyP+DsUdPvvxDnTRzl9DnVRtLQ0wAkv/Q=
X-Received: by 2002:a05:6214:600e:b0:8ac:aeb0:2eb4 with SMTP id 6a1803df08f44-8b3ede04448mr57443756d6.45.1777470943491;
        Wed, 29 Apr 2026 06:55:43 -0700 (PDT)
X-Received: by 2002:a05:6214:600e:b0:8ac:aeb0:2eb4 with SMTP id 6a1803df08f44-8b3ede04448mr57443326d6.45.1777470943011;
        Wed, 29 Apr 2026 06:55:43 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef86e2f1sm21005096d6.48.2026.04.29.06.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:55:42 -0700 (PDT)
Date: Wed, 29 Apr 2026 09:55:39 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v2 01/12] clk: add new flag CLK_ROUNDING_NOOP
Message-ID: <afIN2y_PCGofGAKD@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com>
 <20260309-clk-det-rate-fw-managed-v2-1-c48ef5a3100a@redhat.com>
 <177742893645.5403.3938693995862346406@localhost.localdomain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <177742893645.5403.3938693995862346406@localhost.localdomain>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D_Ey3SDh65fvS0fQOmOGvgbEvWgU16RRxwSDdz3PK-0_1777470944
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2026 at 07:15:36PM -0700, Stephen Boyd wrote:
> Quoting Brian Masney (2026-03-09 07:38:40)
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index fd418dc988b1c60c49e3ac9c0c44aa132dd5da28..1187e5b1dbc123d2d2c1f43690d7dcf75a7c4ac3 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1673,7 +1690,7 @@ EXPORT_SYMBOL_GPL(clk_hw_forward_rate_request);
> >  
> >  static bool clk_core_can_round(struct clk_core * const core)
> >  {
> > -       return core->ops->determine_rate;
> > +       return core->ops->determine_rate || clk_is_rounding_noop(core);
> >  }
> >  
> >  static int clk_core_round_rate_nolock(struct clk_core *core,
> > @@ -3528,6 +3545,7 @@ static const struct {
> >         ENTRY(CLK_IS_CRITICAL),
> >         ENTRY(CLK_OPS_PARENT_ENABLE),
> >         ENTRY(CLK_DUTY_CYCLE_PARENT),
> > +       ENTRY(CLK_ROUNDING_NOOP),
> >  #undef ENTRY
> >  };
> >  
> > @@ -3906,13 +3924,19 @@ static int __clk_core_init(struct clk_core *core)
> >  
> >         /* check that clk_ops are sane.  See Documentation/driver-api/clk.rst */
> >         if (core->ops->set_rate && !core->ops->determine_rate &&
> > -             core->ops->recalc_rate) {
> > +             core->ops->recalc_rate && !clk_is_rounding_noop(core)) {
> >                 pr_err("%s: %s must implement .determine_rate in addition to .recalc_rate\n",
> >                        __func__, core->name);
> >                 ret = -EINVAL;
> >                 goto out;
> >         }
> >  
> > +       if (clk_is_rounding_noop(core) && core->ops->determine_rate) {
> > +               pr_err("%s: %s cannot implement both .determine_rate and CLK_ROUNDING_NOOP\n",
> > +                      __func__, core->name);
> > +               goto out;
> > +       }
> > +
> 
> This hunk has me irked. I'd rather we export some function like
> clk_determine_rate_noop() that just returns 0 instead of adding another
> flag. The chance that someone can get it wrong goes down and you can
> naturally grep for any clks that are using determine_rate() without
> having to also include this flag in the grep. It makes it easier to
> reason about as well because we can have code that just checks for
> determine_rate presence instead of both (i.e. clk_core_can_round() isn't
> changed). Plus a clk_ops structure is more self-contained because it
> doesn't rely on the clk flags to go with it.

I also like the clk_determine_rate_noop() approach much better as well.
I'll send a new version.

Thanks,
Brian

