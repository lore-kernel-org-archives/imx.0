Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016539;
	b=BsQ19et1Rki3S916XXRmJvbuJvyc7iO+pRCX9SaSkGowtPQ/QhRk20bA3gVTTSGO6upD
	 J3U9/6Dw6hYsIPw4F04Z0ryCMCGhp8GMktMuvf1gf2YRbd8Ycq9zHoa73BIF4lx3kzgjp
	 hYiMvg0O/JfmdcP2vHgxyslhd1dvvBLmCdl5Hv2h10b9jAqPQj9HW1wtz/gh3vRbC+Qf9
	 rxe62HpSXUBi4tpo/eSr70CqeBDHFxRoRLfTpaKoYCZPmm98ArWLt6+5w2WzaEVGO9nZM
	 X+XJ+fBB1oQiO2ellwlBZLpLN7uK8pa7txe1RBOMimyB6TRuCa4llDzQDn3q8MEg1/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=CN3uhxZTJ97ugRoC/mFf/rnGzVK4gaQ4Bs/xHJQaLBY=;
	b=M7Dw7uSsgeD6SX7lzM8QuykWYZRAv0Mf0l4AdyDweHsALkoBr4Zz+Ypj5RCRzIvuDZMD
	 iRskDCHxKPeF1SupGqJTxGEtmJu0uUTefsX34PDvLFRgJYmgJJTRKDcLz+VOZ/bYrMRMJ
	 iRCIfZDqtEFD32JQfBgyDviV7rLdhu0sjt5LjejT7ejYeIUrwDbF7LMJ+9flVWgzI2jq7
	 OOSn1fB5IGVk1Nfc9mdxrRV4C32n4wr7BWcMSS8/ojWmB881cXtS5joMAiul14E5FXPd/
	 YwWz5lRsHF8ERmWig7lqjKqITpeDBFp1ZrgiwWzjO5RMcKjDcREIKDR0i0RIr8rwxJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f1BK9NXN;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E10606A330
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 15:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9E10606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f1BK9NXN
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso774526a12.1
        for <imx@lists.linux.dev>; Wed, 18 Nov 2026 07:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795016538; x=1795621338; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CN3uhxZTJ97ugRoC/mFf/rnGzVK4gaQ4Bs/xHJQaLBY=;
        b=f1BK9NXNyN1JAaM0w/7Qv5nxbRk4ImDsCPtiu9PPBDFXs+aPPq9zdGFY9AQ4Xk+qDv
         ihtmREHCLfaKuezwvWupnRak1eSPOZ+SPyKQ8RsU9n8XOFfNo8lYBeVEXa5hwtr5W8iT
         mITmEECsGtQJ0XsG5ptjfS2n+WNw9O2bJIzy2Si/785cTSLHnYxcBi+Lx6ALbQZQqPas
         RT8S4zA7ZAiFzxLriAPuEutVjhIRrOVbiRF5jTFN5QAzt4JuM/wYEQ8vNwHHUtVUdxyA
         rWoIqxCx2bTYCsEGPT+mp08Y0ybGBShBg8GHPI2JlWD/C3URs4eD2ckUUWHaq6O5c4mk
         +LCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016538; x=1795621338;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CN3uhxZTJ97ugRoC/mFf/rnGzVK4gaQ4Bs/xHJQaLBY=;
        b=dUK2m2GXccL4TkgH7zyx4VMgCPgmg0TKe9xoAjgtSeBbk+aobUIZmCvo7n7XHhjBfP
         L/hSaTD63JCnew0dYTY01brac6SA/weUgtki6ApOWJivWNIcGXQkmb9nLU7ULij3Z2VG
         6vB9LMQ5si8xoCsDRLBz+kuXqPt12HJ3XWcPeQNuCt/2RRfVD2RMevDZPjJ5vCeyPZdb
         BSVxb492/DWBWDvka8Wks6UarLyCmtbxU2NHNNjOEC04mNz6UfQprJTIatBw0gLLlj4g
         CKDGlqsYKDMVFQsGMPnbPmD6ersFF2sAxhPqa9ZXIp37HVZ5aqouFmO+LOol7LsGoMRn
         yaTQ==
X-Forwarded-Encrypted: i=1; AL+hErHyWgnD9b42WEz5wE8wMOq4dEW9wTpd/sSkYE/VLlrQr5oAhChXKLVMHnfxod6lGtNjYOg=@lists.linux.dev
X-Gm-Message-State: APuU4Z8nI+7kfFstOQyB4SX/XTkGl3wq0BIqLw44G6G2coWAKzGl4RvC
	JbM2wxNG1me0iZl90Vlm1r9BBYCTTrN0guPbMYVQTHsOWsN8fnFx3QBUWKmPj5psqF4=
X-Gm-Gg: AZFdTZepzQeEOHI59mnRTHjNWHoMS/iaGCslD+zyG0XDbWKhUdKZKKCoxHjpZa99DqN
	hMLVlvQzien7WMO6ePFQvQSTDFjy10PuvwqoDydWivv3rBqefPT8ag29bJAVIeV3itcklhQ9BRt
	ZR707OU38tEd9YyKImQ1uXcp8aCBqdO89fKlQ/C5t1MNFts+Cr1SF6aScgh6DrvD+MWkN8N0gzX
	PHCl52Uge5gBRmhEBVVMYOy7neLBL04iPFjdBEFyL7jJ8ileCuZ+eHn5gDtvzueMKhzZjZXWmci
	AqJsc5f7apt+6s1jo1w5EAk1Sgs5gazs+ENlHHGxVBxz6ouJ2mdynb94MBywhhPY5eSAHM2uJ4B
	DNTQkmcUsRmnEzDMWF24wCHYi7FMOzMnKH/qKo2ViBqtBpeIOin5vs2xfl6QpJzm44vWxbCxsev
	cYUPg/00qZbsDFMNyD2KKc1RtY480idRGUN9B6GiGuaFi3r6emf8TMaytnyWE33Hg0BFqVtEr9+
	OXmscxQWyDJHT9tvXzWCWwlpi+j76pfko2bNxc+Ca5Sarx2lhG2kZ7wA9jKTY5ZLXGo7M6mEG8g
	j96x4PIeMuZXJDhUGh9K46P3NAPMF9SfZw==
X-Received: by 2002:a17:902:d2cf:b0:2ef:e06c:38d2 with SMTP id d9443c01a7336-2eff756587bmr30526375ad.54.1795016538193;
        Wed, 18 Nov 2026 07:42:18 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:9f37:bd39:7f19:3b3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6246213sm16061995ad.56.2026.11.18.07.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:42:17 -0800 (PST)
Date: Wed, 18 Nov 2026 09:42:14 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v2 05/11] remoteproc: virtio: report
 VIRTIO_F_ACCESS_PLATFORM when required
Message-ID: <av3HVh5jlMsyaiq7@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
 <20261102-remoteproc_virtio_map-v2-5-26b300e01c62@valla.it>
 <avs6XQpoQmY_MNYx@p14s>
 <avzQI6R9LubGP7-d@bywater>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avzQI6R9LubGP7-d@bywater>

On Tue, Nov 17, 2026 at 11:18:03PM +0100, Francesco Valla wrote:
> On Mon, Nov 16, 2026 at 11:16:13AM -0600, Mathieu Poirier wrote:
> > On Mon, Nov 02, 2026 at 12:26:42AM +0100, Francesco Valla wrote:
> > > Depending on the driver originating them, data buffers used for virtio
> > > communication can either:
> > > 
> > >   - already be allocated from the coherent memory area that is
> > >     accessible by the remote processor; this is the case of
> > >     remoteproc-specific virtio devices, i.e., rpmsg and rproc-serial;
> > >   - be allocated from generic kmem, and thus not necessarily accessible
> > >     directly by the remote processor.
> > > 
> > > In the second case, the DMA APIs can be exploited to obtain a
> > > functional communication, since they will take care of cache maintenance
> > > and - if required - bounce buffering. The VIRTIO_F_ACCESS_PLATFORM
> > > feature flag can be used for this purpose: with it set, the virtio
> > > framework will use the aforementioned DMA APIs to map and unmap buffers.
> > > 
> > > Bounce buffering will be transparently used in two cases:
> > > 
> > >   - if the buffer address supplied by the virtio driver is not suitable
> > >     for DMA transfers, or
> > >   - if the reserved memory associated to the vdev is a
> > >     restricted-dma-pool; in this case, *all* buffers will be bounced to
> > >     and from this pool.
> > > 
> > > With this support in place, any kind of virtio device can be supported
> > > through the remoteproc-virtio transport, at least from a data exchange
> > > standpoint.
> > > 
> > > Note that remote processors behind an IOMMU need da == pa for the memory
> > > region(s) the buffers are allocated from.
> > 
> > I'm not sure to understand the da == pa requirement - can you expand more on
> > that?
> > 
> 
> Yes! With a caveat: the IOMMU usage by the remoteproc framework and how
> it can integrate with this work is the main reason this is an RFC, as
> stated in the cover letter, because I'm not sure I understand all of it.
> See for example the dma-to-da conversion in [1] or the comment in [2].
>

The remoteproc subsystem was written a _very_ long time ago and the context of
some artefacts, such as [1] and [2], is long lost.
 
> That said: all the IOMMU setup that is done today by the remoteproc core
> is linked to the *remoteproc* device, not to the rproc_vdev (i.e., the
> device backing the virtio device). For that reason, the DMA subsystem
> should not be able to know that setup even exists, in particular while
> performing swiotlb operations. Hence, the requirement to have a 1:1
> mapping between da (i.e., the address the device uses) and pa (the
> physical memory map).

I would like to reserve the current remoteproc IOMMU design for handling legacy
rproc-virtio devices, i.e rpmsg and serial, and only use the modern
virtio/swiotlb API to handle authentic rproc-virtio devices.

Based on what I see here [3], I think above sentence:

"Note that remote processors behind an IOMMU need da == pa for the memory..."

should be replaced with:

"Note that remote processors not behind an IOMMU need da == pa for the memory..."

[3]. https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L703 

> 
> > > 
> > > Existing use cases (e.g., rpmsg and virtio-console) are not impacted as
> > > they are explicitly excluded.
> > > 
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  drivers/remoteproc/remoteproc_virtio.c | 10 ++++++++--
> > >  1 file changed, 8 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > index f1b362158a9c..1496659ddff9 100644
> > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > @@ -280,9 +280,14 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
> > >  	 * All non-remoteproc-specific virtio devices are assumed to be
> > >  	 * compliant with virtio specifications 1.x; there is no other method
> > >  	 * to transmit this capability from the remote processor to the host.
> > > +	 *
> > > +	 * Virtio devices that are specific for remoteproc usage take care on
> > > +	 * their own to allocate memory from the device's coherent pool; use
> > > +	 * the DMA APIs for the others through VIRTIO_F_ACCESS_PLATFORM.
> > >  	 */
> > >  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> > > -		features |= (1ULL << VIRTIO_F_VERSION_1);
> > > +		features |= ((1ULL << VIRTIO_F_VERSION_1) |
> > > +			     (1ULL << VIRTIO_F_ACCESS_PLATFORM));
> > >  
> > >  	return features;
> > >  }
> > > @@ -312,7 +317,8 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
> > >  	features = vdev->features;
> > >  
> > >  	if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
> > > -		features &= ~(1ULL << VIRTIO_F_VERSION_1);
> > > +		features &= ~((1ULL << VIRTIO_F_VERSION_1) |
> > > +			      (1ULL << VIRTIO_F_ACCESS_PLATFORM));
> > >  
> > >  	if (WARN_ON((u32)vdev->features != features))
> > >  		return -EINVAL;
> > > 
> > > -- 
> > > 2.56.0
> > > 
> > 
> 
> Thank you!
> 
> Reagrds,
> Francesco
> 
> [1] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L716
> [2] https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/remoteproc/remoteproc_core.c#L461
> 
