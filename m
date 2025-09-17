Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC19139D1B
	for <imx@lists.linux.dev>; Wed, 17 Sep 2025 02:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758075463; cv=none; b=gJucjXeOcYxaIYVD8dNLxPEGrK5ySV6BLhjyLPUK/FwKappKVf8SEOxUg/NTcHZ0PIvXyNuVWbaPwtxV15P96tUP2B/t/G9zeZs/N9wtGM9FFP5wmPz4SLzQJSgCPpHviAOgMjS7SrhjdEn8dC7nuxStNy5JSCMt+XWQQRULsoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758075463; c=relaxed/simple;
	bh=Kd/aHdn/061S6f2KlRTjC4Sz1PFm4yi8eU6BlkyrouM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PdpaHIUcRvB4G4e7WYQ5bI60WjaRVR+F3yq8aYpftvTSeU58iG4DRjOmADK38j9zkNUEryrZzlkqwV/Q/Buy5L4Qavy3v5H+FiUpFjh2QwVkjdNmRCtaLP2zoDR1nehLs6nay/yTDo3AlTlVME8bJfODYN0ZEQr9K8BcuNzeEdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DX3J95Gh; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DX3J95Gh"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cRMqJ2bZnz9v0X;
	Wed, 17 Sep 2025 04:17:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758075452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hYZlavsGsYMvMuDImVchJjtEZ+fzfmDCFdAdekFJbZI=;
	b=DX3J95GhEEhGIvepllIW1gmmWf0NPMQvhJQFMI49rUIuIMXMIn5Qo6wzo6JY1iggIlQMUc
	YcDwdic1zuXlJAo3XmnPW2D/wqdcKYGhsyzgBrC/cno6G0eOfE0TGlOrSpO8svVrBpDqRx
	o73jTD+rknZIf6w/FIEaw/lQPvpinmu+AAy97en/ChFRNiTrE9I1RJKsK16MpqYXqeRas/
	/7roj3JKFTMTR7yIh3tt5coxmJ7QT5HkRdwzmylQgAncGCwfkSg/3orGqK4ApnJDK7KNmS
	DQe2azn3QnTS97yXA2AfwUsWlKVTgmA+ACg18GO9Vvl6sNXIJdeD7+hv9i5lKA==
Message-ID: <c1a45cfa-a249-4782-b5c8-0ee2d173fc97@mailbox.org>
Date: Wed, 17 Sep 2025 04:17:27 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: airlied@gmail.com, boris.brezillon@collabora.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, peng.fan@nxp.com, robh@kernel.org,
 s.hauer@pengutronix.de, shawnguo@kernel.org, simona@ffwll.ch,
 sre@kernel.org, steven.price@arm.com, tzimmermann@suse.de
References: <20250325155231.0d1b1000@collabora.com>
 <838a0c6b-845b-428d-86b3-1480e5b8080f@mailbox.org>
 <20250904082224.113d0cd1@fedora>
 <7d4e773b-64ac-49ce-8d8b-7a39c353d18f@mailbox.org>
 <20250904160445.1671f140@fedora>
 <36298ed9-05e4-4871-8e99-dfe814342c29@mailbox.org>
 <20250904172019.58e5f589@fedora>
 <4147d10f-fb54-4f1b-ac1b-58cf657a3aeb@mailbox.org>
 <aMk1CISrn2_p0qzJ@oss.nxp.com>
 <c34dc4bc-de12-42fc-aaf5-50474dc53042@mailbox.org>
 <aMoTtr9KmdrgDUiE@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aMoTtr9KmdrgDUiE@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: dfd0912c7d1407435e0
X-MBO-RS-META: 7cm7ougi35mktp3698jjkyq6oj4cauw5

On 9/17/25 3:49 AM, Rain Yang wrote:

Hello Jiyu,

> Hi Marek,
> sorry for the inconvienence. this uboot version don't include SM-184's change.
> I heard you're using i.MX95 A1 Chip, so you can extract the uboot in below link[1],
> or build from source, or raise one ticket in this website[2].

I use mainline U-Boot 2025.07 with about 10 extra patches, but nothing 
significant. I don't think this is U-Boot issue, is it ?

I can rebuild SM, which commit in SM (from imx-sm repository) do I need 
to use ?

-- 
Best regards,
Marek Vasut
