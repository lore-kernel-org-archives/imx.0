Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8991452758B
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 17:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170230; cv=none; b=t2DA2EUewPyJxm1fLXlDDD1THKtjkQp6olLJV379t0i1me09UAzIrhkxLtTvxbCWy4khCSE4xjIrhd280nHWPTkjLwqLWq2qE64Sf3Doyeb4TYjKtvhyAgl55o0/MO3mZFQSAgneFc/H+OZuCNeGDRSMp+i6eo8WAL7kqSUZ9xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170230; c=relaxed/simple;
	bh=EFCs/t5NZCKL85wyMYHIYg1c+baJsqxbMSrz9KygYjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDQNRzs4RmstfGeA6Zo8TKv6g7q41ViMSe9rmbMxCuRunxIm1Bawj5QKsLvq+fPlymHZ0UE/JZ5fwTzXynoIrX/vJ/fUnNJiHjaUWbLwIbAuxJZ9JyBFmpvx+V+kqPpSzObV2ZffcU9gLI2BsvBQWdvhsn2yuVQCqTliZ5w5eDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/7RUmJi; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/7RUmJi"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49ff680331aso1880905e9.3
        for <imx@lists.linux.dev>; Fri, 16 Oct 2026 10:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792170225; x=1792775025; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ARaK25Q0RvNaVHGLi0NUl1nvj8h/slmPHHRftuSOT6c=;
        b=l/7RUmJiS6k3mlyYANVPcng7vIt2ZSdFofU/5C++Sr718wcyzQlr0urB/ZbziR07V3
         Gshsi7Mu4/p9MWDb1CcElt7z5GysL3vrpCktccRdZujb7/WjJvTAWY1wNSUz7Tfzsf3z
         SZpFolMt0gKsMNwdUyP9L3FiWb3prhXZV+9WCkWWdJGqs/CfvavfUHiySeJe+3AovnJf
         wRzJZH/31sgidySxaJ6Ehhj93L5E23mtOSpboeW6oLKHNwRaftMwUk/KJN0/oMzQVCav
         9i+G9r5EmkN3Ly0FCks2zz5YSYy/nFlGt4xzl6g8EsuyZTvJqzdOdDiDYD8RZO4zMrfC
         wSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792170225; x=1792775025;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ARaK25Q0RvNaVHGLi0NUl1nvj8h/slmPHHRftuSOT6c=;
        b=GjUw1mM2xYNcdxhq0Ni5KAd0SqTBEkcyMc6zNcdxjzT1PInJMO1KzvEwG702i1O1qn
         zDjTr5ppZvWP/MEzByHd/TfWNMvXj5lhCXbuZbT3riZw7SKbhCSl93n7KX/G/1tVDnrv
         uqnLkDPcb+lBL0k2yQ+tfVG3AF6sH9U+UEzKtoW3kPtlqBOfPPaf4yznKWajXY5U8AwE
         Oq/NDT14NVcW5tmeXsgzdqBuqDdBdG7zjYlucZROHbwoOn27ddlrjcOH+2c2xfK+jQOQ
         aSuGIOv4pR8xL+XknOYQnyBPH6uXyMddyQNc0D14pyZisAP9p09PVBpHHrDnEOhMt2SP
         I4mA==
X-Forwarded-Encrypted: i=1; AKwUvBw8OkQU4NpgOt3H7urmIolygbF9LaS+wmH2syjRexi0e669Q7rQOY5PcVK2cuzz8S0sb4I=@lists.linux.dev
X-Gm-Message-State: AFq9FYLh2hUlJ4MWiAO48GmGWafkGC7wPTVgKSs+s4DjpJ1C8gICGxlV
	0f/oE10fkVJnFePsqAeI51BxIUM+OQG+OCCsNnIduNhML6gqPded7Db3
X-Gm-Gg: AYBFou1YsBKcsR+tyq5xdjigrGX8X0vBKZfL1j7pxnXMp+FACVLuEhxhxiGvvOlO0Jm
	ACYtT5suKT1/yhvKwow9PORkYLF+0bTpokHaH9Skz4cRvXtPwxgQksE/XOTPcOp5nOE/ZqhIW4M
	ErNX4kcIKRYHx47ubuI/pYtc5XliTtiFm69h5axVX+7+PvpUL0pzYmXZ4E2eRYXz72wMpS82Puj
	6Fd9ObbcbZq+wfKWwc2zYRAjzvrBM+U9QR/F2isqmqWwY5YcDUPRbtyf1O5oNRKmzMqZb0Stuod
	FYRQoTbqCR01OPiTyxG/drjI7He40uGE7fI3LDPiNZJKCh51Z5LXHbPo5d1QnAbnFBw/rrF+2UT
	znWK62Vmrj12lgLoQ+apdUiPTww+ucy6aKEqKlo6dvRVl9LynlVuZaJ1ZSc4ZITRYTbrYJQmkNU
	N4Wu65gqPDC9k20J0AbP4NITBzpFJg2P9qixHYpsmISb4EadFxoejv2w+D9ClL9VOXE5sLSyN/N
	fFBhUGl1+r2Rfn3cOgoSblR7/Y7upiF3CmpcV9aRZd4MUC7iBNd8qIsLiZkmn5bx2tIqgQ2+0f/
	gGqmQHhz2I9LKdiT3xGVDmjb119IeQ==
X-Received: by 2002:a05:600c:4e14:b0:4a1:d307:b526 with SMTP id 5b1f17b1804b1-4a1d7464034mr10105175e9.0.1792170220437;
        Fri, 16 Oct 2026 10:03:40 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8ebdsm186598225e9.10.2026.10.16.10.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 10:03:39 -0700 (PDT)
Date: Fri, 16 Oct 2026 19:03:36 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mm-var-dart-sonata: Add OV5640
 camera support
Message-ID: <atJY6DzjmAeq7U8q@Lord-Beerus.station>
References: <20261015162301.63838-1-stefano.r@variscite.com>
 <atEci_KwxUdvAekv@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atEci_KwxUdvAekv@SMW015318>

On Thu, Oct 15, 2026 at 01:33:47PM -0500, Frank Li wrote:
> On Thu, Oct 15, 2026 at 06:23:01PM +0200, Stefano Radaelli wrote:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> >
> > Add support for the OV5640 camera connected to the Sonata carrier
> > board's first MIPI CSI port.
> 
> Does this board only support ov5640 camera? Suppose ov5640 module also use
> for other boards.
> 
> Can you refer https://lore.kernel.org/imx/20261011-expulsion-frivolous-690de090cf9d@spud/
> to define connectors?
> 
> Frank
> 

Hi Frank,

Thanks for your feedback! I looked at the Toradex approach you linked.

In our case, the same connector can also accommodate Basler cameras and
potentially other camera modules in the future, while some of our other
carrier boards use different connectors.

Given these differences, I would prefer to keep the classic approach proposed
in this patch, describing the camera directly in the carrier board DTS.
Do you think we should still use connector bindings in our case?
If so, how would you suggest handling these differences?

Thanks,
Best Regards,
Stefano
