Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBD926656D
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 00:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814970; cv=none; b=gZ9I+4w8nHEQ6TgcG41ltQOfmxNpLOA/ddyeJqeOnHYpnXHA4tupgi8enlDLaCEbXBhyPHWvY8eHMKgeCIVjzPBWdY5PI22FB3JvNldXtZExd+oWwrGLtistZHat8AWCkQLgH4u8TJ/sTGvZKFC2vECMsMfDZ7OnOPzVng0GM6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814970; c=relaxed/simple;
	bh=mEiOxK6qgL2knbgWwksX7Taq8hLellRiYQOPrC1ldZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iMvLBsUctZ01EaPmajaxS4SWosT9JsyvbRXfhtCTmY2mrOqnpPtmwmgTdQjAd3qBSvmVTyY5r8FbsqYZ7q6ZO5n7iRUuOdK7ckiGSHJqWzZiPSlLLbskiaHgP8UbIzCsovpY7loRINlDUa3bcXLAf/hSq4l7PB1D0IhFhILJqHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CG/ZM/dm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CG/ZM/dm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790814965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YsV5MN4aFpGUFvwk6vrhGH7My89v8MB96omgdQVAOpM=;
	b=CG/ZM/dmk6KXA1zKuMIsS2aZv/KZzK7HhUngGJ1F6PN9hIFgQEtAPAN/C+d/naO8JX/+qp
	4yg0uXkAvSFK7uzBynX5+q7EUpHJFbmePqlsqG1EEOUvFXMzmwsb/jc9zo7lbvaf81Dkfx
	AA3GgVwIv1O/u7guBslUJnamtulbCWc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-c1NcrS16NJmJ8DrZNVc_Ag-1; Wed, 30 Sep 2026 20:36:04 -0400
X-MC-Unique: c1NcrS16NJmJ8DrZNVc_Ag-1
X-Mimecast-MFC-AGG-ID: c1NcrS16NJmJ8DrZNVc_Ag_1790814963
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917a3c27c9bso11066296d6.0
        for <imx@lists.linux.dev>; Wed, 30 Sep 2026 17:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790814963; x=1791419763;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YsV5MN4aFpGUFvwk6vrhGH7My89v8MB96omgdQVAOpM=;
        b=jwYey92rnzw5tovSLKgQSAzb/HMOToPfi5T5Edn6RvmtxanFhSKRTEDmtLfqlnS7Fk
         bX3nOqhQV2sicsJ8TEy0eK0PiQrU0tpYvW0pmUKC1cw1GSCF5LiNxp1Ymvy/TuJ0qEfp
         0iUEpZToL7TZtHadQCwuEXG0b8G6tsvycfqMb+916eBF0JEzPDz7hf3RN9wZnC7Wrm4M
         xusfYYbm9DvH6jSd+1W/j1/ckabXbva6XHNsL2S7wEJcxrRJB8koaG7DN3Q46yfS91UW
         h1aS8Iqx4t4M1yCk+4h0KkSLVsykc/3xRU3UnbQ8SuWGaA3hi7gZjOu4IqyFhO67N+24
         rEMA==
X-Forwarded-Encrypted: i=1; AKwUvBw9h8ZpJhorXeVh7Sw28BQIEnolutcx9h425/1m9UiEc1TiMeVPC3G8IwzWaf+rTx5qXQg=@lists.linux.dev
X-Gm-Message-State: AFq9FYLOYQQzynEAY/K05opxs5SH6eT+B46Xs2JHDk+G01t38FVOs20n
	aJCVQPjRZQCfwjK0xqmdoAq8qw+0artXqFEOM3uik51Fm6Jc7kJCUcht802CWkDIIotC+sa/vsW
	KLs7ZAJ1j70Woc125A9uRLFbEHid/9RN0nU5F1Ua7Ag5jeUDBXAeJFA==
X-Gm-Gg: AYBFou0eq1YOogcgRgGfTxdY0XrMnqX4ZUmWq38CJ4w7VYRZxxMHExGT7RexcNL15WC
	QiRxM4DqWuJkwYHQk7hYj+B3nf2XG6NcW0ebXy2FKba0i0mKPKw0qazgz5k6URF0hmmBpmrQDy3
	0BPTDiq4Zl38UwHK8mUj7FIXSEuY+npYjWzA3b1CRAhhM0ITBn2Q/Jv1B/ZNj84Fgwg/NBwX4WE
	e7xyfhU9j/HtPhj36hXXmnUOsNiGD3IOud02p3nVTac5d6A7rjVxDtbpTsqAoLulRoEyPii+ddM
	fOLquWiQaKNKibjsdy7xVOBosSEMa9e3n8+4ZQXj7jNMBBD3sg/WF/ypUApMzZ1DnM4SQ2xEfUL
	DVUjMTLx139TxNEU8+TQjXo4G28g9dcTv0WI=
X-Received: by 2002:ad4:5aa5:0:b0:915:e58c:9036 with SMTP id 6a1803df08f44-917a0a02e72mr59189246d6.6.1790814963461;
        Wed, 30 Sep 2026 17:36:03 -0700 (PDT)
X-Received: by 2002:ad4:5aa5:0:b0:915:e58c:9036 with SMTP id 6a1803df08f44-917a0a02e72mr59188656d6.6.1790814962863;
        Wed, 30 Sep 2026 17:36:02 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917a881aba3sm12432406d6.2.2026.09.30.17.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:36:02 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:36:00 -0400
From: Brian Masney <bmasney@redhat.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: (subset) [PATCH v14 0/4] Support spread spectrum clocking for
 i.MX8M PLLs
Message-ID: <ar2q8M7Sn9DccVBI@redhat.com>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
 <179070048452.199845.10870046832708018931.b4-ty@b4>
 <CABGWkvojte=RG=BJ=jvcq5HfUcYUZNsWNN+c5zDh-449VJ8Svg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CABGWkvojte=RG=BJ=jvcq5HfUcYUZNsWNN+c5zDh-449VJ8Svg@mail.gmail.com>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: azLPlGKh820_dWoa0k6Wm_NcDfzB1aTlLaEWAG4SK7s_1790814963
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

+ Sudeep

Hi Dario,

On Wed, Sep 30, 2026 at 11:01:28AM +0200, Dario Binacchi wrote:
> On Tue, Sep 29, 2026 at 6:48 PM Brian Masney <bmasney@redhat.com> wrote:
> >
> >
> > On Fri, 04 Sep 2026 12:06:29 +0200, Dario Binacchi wrote:
> > > Support spread spectrum clocking for i.MX8M PLLs
> > >
> > > The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
> > > PLLs (audio, video and DRAM). It has been tested for the video PLL on
> > > boards using i.MX8MN and i.MX8MP.
> > >
> > > While at it, it validates the spread spectrum configuration in the clk
> > > core before it reaches the providers, and fixes the i.MX SCMI OEM
> > > extension, which converted the spread to the wrong unit.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [2/4] clk: validate spread spectrum configuration
> >       commit: 109124b8ff43fb911d5b8790bb5e4c5684f72d88
> 
> Thanks for picking up patch 2/4.
> 
> I put the two fixes at the head of the series expecting them to go in together.
> Am I missing something for 1/4?
> 
> And how should 3/4 and 4/4 be handled?

I can pick up the other SCMI patches, however I am waiting for a
Reviewed-by or an Acked-by from Sudeep for the SCMI changes in patches 1
and 3. It looks like Sudeep wasn't CCed on the original series so I added
him.

Abel is the maintainer for imx in patch 4. I can take this as well,
however I'd need an Acked by from Abel.

Brian

