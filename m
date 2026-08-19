Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00104508E0
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 11:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787140623; cv=none; b=SNhUTLMm/MN5iRiRGxyi/zmcH8a4HxVmnuzJWcm8OFAkdBxNFiCoiifQ/OsvRLMJhqDRAk2phJ2T6Gde1Qt241LUF7p9pYmFJZ98Ti1XZX19xj9bZQtfAby62V3GAuql7awznHfUS+IyJWBZz1KczciLxamQC7LD0zqEPM7eJ7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787140623; c=relaxed/simple;
	bh=DOIClZcHf+ibfx2/byeHUht3sy5hNumJQv+OQtNyHSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4qUym30qcKyDVH7+uRiJT7yDdw+aZRy7I+JyivYucKqAhFs4vdO6Ajk7EF0udkCmo1T3g5TSLSpKDfO0OoYDckS6O66LMbb+NcSVwlHottJtOPSPeSRESVZ9ig9Ej3wbdaBj6yaCehmhxMl8WgqqFyQLjqRAlsgaFGds5Tq2tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1IULOZ/; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1IULOZ/"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66c711b7f2aso1613480d50.3
        for <imx@lists.linux.dev>; Wed, 19 Aug 2026 04:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787140620; x=1787745420; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iRrXiWbp5BCMXI1+0yfdqp8zjwVidH0MdyBqKFKUh/E=;
        b=b1IULOZ/M8RQR5RV/DyFWOfA4d5bW2bQb0BkI/W3dSCWWwxlVt43FdrD1OjTR6ZhKV
         1fqd8T4iLrE6Iqtz5TTQ/lLNKrl/Yw2q/YSZnkT738B13TTZzP0FhTp2sggyvQv7uPnp
         SKT4Rk6k4ShvcI1+Hg0EH9ITr4v6z67AkEdMJIwDhrHJYxuS0dHLqzYvYI3gJ70XIqt0
         3H51LuQ1PEi7lf9f7hcvT2AZwUB6Gz8duBew7b23YI9wE+ojwKTfVCgP1zBiYVysIkPw
         LlYjDTwuT45XmFi+eMealv2TXZI8MPvpPPPd9SCw/Q4ECud32Q6MtcQHC7VL1YEx/GMO
         vWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787140620; x=1787745420;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRrXiWbp5BCMXI1+0yfdqp8zjwVidH0MdyBqKFKUh/E=;
        b=SJZi4s09mcuDDlA6OrBLHGYLGx/w9RHwVoYEHmJgAq8vXJEtZPIZz9DcHysazkDvx4
         Pwsh6tKyXFh/a5rb+u6Aa5ki017vqX2ZuTbyiUnmR8CRx47o3UoqtQHsF1+ZZaAeCm2T
         fprqUEErxj5zlIFm9YVWf1j9hm31bWZyp0ZWtw7uUOfNAxe/nLBN6L/TiDV1SXvM9nlb
         QI7KxlFCxzSwni+NT5Yt7VWBNYtY3TvizdmNikwScs+DIxF3DmPdsDh1+fhDuv++iDK7
         b8AuyDF4LYXU1s1B/K1Yue0qSiKj4Bpuj9a7fADYEU4l2ROaZ1ij4CmsqkvW8NzVjMfu
         BrAg==
X-Forwarded-Encrypted: i=1; AHgh+Rqhb/eaZwM15mlGPUjADlR8X/j8BkadO1iguQFIEIF0Kf6UjY8q8NYfmtm5bj5iwUAmWwM=@lists.linux.dev
X-Gm-Message-State: AFuF++kuDmlwo0ho5IMz3WBb1crYCmsBxpa6Sb7b9MLw5LvAYGrb4mBN
	3hdgtGT2c3sz/sYEy20RmTKnv6ukERErvKp9SWhMsoLcUJ7I0nLW/7Ik
X-Gm-Gg: AR+sD13x56xOwR3TV9Ak4G6f1HFBaXHBubqWIsOosPBLHfcyLjK/4AZ+u+nY5xU4ihb
	3WVfx97EAVHbiGXKUwUXSlgaFYFvrDkyrAoy5S2bMNxUlSUjRRSFNepbvKAPEU6ALJTVB5+t0Qn
	p67Y9wwN8leo+m8VRu2n5i6Rkb4jn+cno3htU3dTAX+oNKq8iI6HW8S5JGczu5t5XoJp/afF8vH
	qGawRjFQGpPaO6n762KSrfciwDRonelXGTXVE7xJA3cmgt0Lqsnq5UiVcuUIi/kPVdwE8gCx3Md
	8uIg2K0waKLzaTZqp9gAduuJ/MGNHWE3nHh/RyztesrE2/ZEMRj4kTEaBA0O/sKFIWBfg8bvVqx
	d6hY4uN01F254rKirwctS+Rkxe6J701j3DGA3sRJEfjLQr6SkztWV6bDN2iIV0MMbh4K+Gs2iSM
	esC1DwOWiMm3pMSo6IbcBxQdE5MlWCmZo7mR3HsktG3v9kiV3ruKXphn4z2n7/DZPTHPc=
X-Received: by 2002:a05:690e:4807:b0:66c:82b5:7d59 with SMTP id 956f58d0204a3-66ccb5cf30amr1129726d50.12.1787140620402;
        Wed, 19 Aug 2026 04:57:00 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66ccb1a03c5sm817419d50.20.2026.08.19.04.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:56:59 -0700 (PDT)
Date: Wed, 19 Aug 2026 08:56:53 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <gsihg6tzkrq6gcygquzbjtiqntvoxp67lo6mqntnmbyvyw7s3y@suv4t26pl5eh>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
 <an3tiDOUUYLb8PAq@SMW015318>
 <juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf>
 <aoSqJ7pHEgJ_RZmr@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoSqJ7pHEgJ_RZmr@SMW015318>

On Tue, Aug 18, 2026 at 01:53:27PM -0500, Frank Li wrote:
> On Tue, Aug 18, 2026 at 03:08:33PM -0300, Leonardo Costa wrote:
> > It seems that the drivers are being deferred at boot start by the
> > device_links_check_suppliers() function. It runs through the drivers before
> > they're initialized and defers them if their suppliers are not available. The
> > GPIO and PWM drivers are able to follow the gpio-map and pwm-map properties
> > (through the of_parse_phandle_with_args_map() function), but from what I see,
> > device_links_check_suppliers() has no such mechanism. It follows the phandle to
> > the nexus connector node only, and since there's no compatible driver for it,
> > the function defers the consumer drivers used in the overlay.
> >
> > I think this is what is happening mainly because setting the
> > fw_devlink=permissive kernel parameter (which sets the DL_FLAG_SYNC_STATE_ONLY
> > flag) solved the issue, though I could be misunderstanding something.
> >
> > 	int device_links_check_suppliers(struct device *dev)
> > 	{
> > 		...
> > 		list_for_each_entry(link, &dev->links.suppliers, c_node) {
> > 			...
> >
> > 			if (link->status != DL_STATE_AVAILABLE &&
> > 			    !device_link_test(link, DL_FLAG_SYNC_STATE_ONLY)) {
> >
> > 				...
> > 				device_links_missing_supplier(dev);
> > 				ret = dev_err_probe(dev, -EPROBE_DEFER,
> > 						    "supplier %s not ready\n", dev_name(link->supplier));
> > 				break;
> > 			}
> > 			WRITE_ONCE(link->status, DL_STATE_CONSUMER_PROBE);
> > 		}
> > 		...
> > 	}
> >
> > Has this behavior been observed before? Do you know of any work being done that
> > addresses this?
> 
> Does a dummy container driver (for debug) to proof your analyer?  Let
> me to find time to debug it.
> 
> Frank

I made a dummy driver matching that compatible string, and yes, it did
solve the issue.

Leonardo
