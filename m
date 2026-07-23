Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98CBE367B73
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 16:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822609; cv=none; b=WOPQ2ZTXsQanF/WW0xSLvtze7bHFSebGnnJQLl7DxwaiocXA0iTzjVqwyrwmpgzb+tgPkadj7V40jqZ9HBgn3tBcovVPa434jb5u/3CXNlhSDPclTrnyUID0eJ8FGTlHONZVnvC1f5QiiNft7Fky+3vvBc5YSYoXT+UfZqm9H/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822609; c=relaxed/simple;
	bh=VTnbRjkRfnE2uas3pcgZxwwolCVAb6XAOATCiHQXgO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=URr7MUir3ACHbRK8hZJpQyRcHlGviQxgGfjGiGExImbIDLSRFl79yQu4c1aRH/+LjEClUxCCTMPcjjPoYt3yNP5MHXF7aLLNCb4+helkQmf3Vm31FtJxP9AAT0GrAkHlFxM4NeORmefAJw3YIW1gcTSFHzwigLN864iKb5CoM8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HBWeEXlp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HBWeEXlp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784822605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JUjkJdrGHF/uTpDAifvyQqEKmF6q4j5F7jAbk0W/44I=;
	b=HBWeEXlpVWqlroy1A1o+eBMYeRBMFyaf41U2p2e77/LL6ctSvxNm5ce2j6LiPCAc3/qzqO
	BhhNpEUB2FpsX4rOHjziKzk3+86nDz1RchJR1omT44gd4WEmu7/Bxk1Xge4oTM2/nla2zN
	LRTKRHwlglqO80nfXKQJWILkHVBSix8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-xOCOUk-2ODixU9_gVAkCOQ-1; Thu, 23 Jul 2026 12:03:24 -0400
X-MC-Unique: xOCOUk-2ODixU9_gVAkCOQ-1
X-Mimecast-MFC-AGG-ID: xOCOUk-2ODixU9_gVAkCOQ_1784822604
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f39a46efd9so8488636d6.1
        for <imx@lists.linux.dev>; Thu, 23 Jul 2026 09:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784822604; x=1785427404;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUjkJdrGHF/uTpDAifvyQqEKmF6q4j5F7jAbk0W/44I=;
        b=Zi+DYoqVwhor2AEMSofmI5hWRqim5Vm7AlulsbB96CEkMRtbgUl7vxAenDz6k1j+BN
         vP08hC74L2yUU1Cm2UcQDpIksN9RCEEC0jFtmPFnFxy7usbVrZRwrUlZKQJ1kWdrM6Hp
         ok66Up6GKHDS8Ao1AZB5zKTWvTZ1SiPuj7x8pyJKaJqHynBMZkd4V8mBQWNiteFCmLta
         w2rfd19kHgCmVeJNhXKfWBtigZRaiYekVNAe7eqpkUYW1AKeIKRIaZPCbNfA/y12l1pt
         lSNXc5RmC4c9Iq29h1ap3jBDuTwwNrKh4nA+4SPCywJoboZbQ0WvyS/xThqAlqnYAsIa
         0u7A==
X-Forwarded-Encrypted: i=1; AHgh+RqQLt+v0giiI4qfiijHceqQmwmsMxXzTfVWZm+PcIVvsD6+fRCuMn5InGLD2SRBCELW3BM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPG4qsfau/Dp3/CrAbnFlOMLDUHaM9slc1pNFEnvLVuiD162a3
	eaGVnC0CD6xBMMBj1v58O3CETpWDbwHBGivuzWkUVxpKZ8WM69ucw0d10PkEKjdhGsXHy3sfIvf
	oSCHdFqricZKIp/ULPrv7+5h6DmR19d1NQPg1WBlkVM5l/BchHWyhXg==
X-Gm-Gg: AR+sD11AJPDlmksIj1eSb06S0yuQGs5kk1Le8DYFmtGu/Ux+53XRKBI4LeEvOBw5vgw
	w7/sWY5fhNpHWSJ5DPBI4ssyQihSaO1OW4BzlWQGBDpUGU8OpX1Ru+J1Ur8DJ6+YNGIGo2olUbN
	+wT0rlM8svFiKwQWMl50CJFWPt2vvZzWevA8dCchchKO5JdSAbi2i/PefuBjjMIDJRFpGfR4L7j
	6OW2GMMdI45wijZ4ARbrc6th32GLVd7ZbKpJRtRgEFrrQo2208CmNlzUzQ2eM/fCZzt7Me0EdSn
	ZYJ5asJ3YrA1sAZvDdUVaTOVc8PEa09JBa5nPLGTU8WSp1XnPpg0/CgJgyYjTbewjTlgzOTKNIM
	C1/mY/3PZsiz9lyuYsKe0933crtTqb3CT9nc=
X-Received: by 2002:a05:6214:4303:b0:8f1:77b7:9bdc with SMTP id 6a1803df08f44-907ccfa7755mr33588136d6.1.1784822603653;
        Thu, 23 Jul 2026 09:03:23 -0700 (PDT)
X-Received: by 2002:a05:6214:4303:b0:8f1:77b7:9bdc with SMTP id 6a1803df08f44-907ccfa7755mr33587566d6.1.1784822603140;
        Thu, 23 Jul 2026 09:03:23 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba672806sm48357536d6.0.2026.07.23.09.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:03:22 -0700 (PDT)
Date: Thu, 23 Jul 2026 12:03:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Zhipeng.wang_1@oss.nxp.com
Cc: robh@kernel.org, saravanak@kernel.org, ulfh@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, peng.fan@nxp.com, aisheng.dong@nxp.com,
	jindong.yue@nxp.com, xuegang.liu@nxp.com,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 3/3] clk: imx: imx8qxp: add soft dependency on SCU
 power domain driver
Message-ID: <amI7SFD1bQjkj6Db@redhat.com>
References: <20260723020524.1886806-1-Zhipeng.wang_1@oss.nxp.com>
 <20260723020524.1886806-4-Zhipeng.wang_1@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260723020524.1886806-4-Zhipeng.wang_1@oss.nxp.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uPBOggGHXxirhlAeu9CANbJ7P_2lDoqTr8pqChsZm7U_1784822604
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 23, 2026 at 11:05:24AM +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> 
> The i.MX8QXP SCU clock driver manually attaches power domains to each
> clock device via of_genpd_add_device() in imx_clk_scu_attach_pd().
> If the SCU power domain provider has not probed yet, the attachment
> fails silently with a pr_warn() and the clock device is registered
> without a power domain.
> 
> When both drivers are built as modules, there is no implicit
> dependency to guarantee load order. Add MODULE_SOFTDEP("pre:
> scu_pd") so that modprobe loads the SCU power domain module
> before the clock module.
> 
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

Long term, it would be nice to fix the probe deferral issues via a
separate series.

