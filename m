Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C285E4C98
	for <imx@lists.linux.dev>; Sun, 28 Sep 2025 16:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759078629; cv=none; b=BeaZDk1u+4WmyUCkuOUIPufpRuHPSyNd74mWHsVCPATUTxvX9145oR3Kz15IbBqM5UcrYpOy60vOeVrm+Tbec30bIh+51E1iHSqbeC/ZqsHYhKy0LvVOjJwsouBwQYjOM5PedDPYZPpCSFkUbxEv007PLDcwrdeJgZBGGkoi49o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759078629; c=relaxed/simple;
	bh=xujErc0QSlYq7R2METgndt3Q6nhNzJsdH6KXtpfhUWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjCDbBlVLB//4YjESejrTM6jW2+HGsp2D9i7eyejTblRkzZIPdgq5ohP0s4O2Eg/aMn7hRTLWzutnBQmedefxYXXK8emxizNpnDEK7gCQvuIrVUpPQZ0UPBPcXOypPp+6ye+w+gTeOb65sL2KglHKHxR7UPduvUzkiPXklRUeMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xHuubiMS; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xHuubiMS"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cZVpy4LP0z9sST;
	Sun, 28 Sep 2025 18:56:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1759078618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q3CPsXihGUBBwniCQJtpfCea9ZS+16bumyYVi9msdPY=;
	b=xHuubiMSI1U7n2AhL8UbwNP5D24fqsTalz73+pLetWsJpayvL0H7U0vNPv/fXMsI76dT9Y
	BA0jodO4DTAljzh5/955NxjTofoDmHZfTNUOzlkDS3J171LiYOLyY2SDUBvNsaq1Zwh5zL
	6JrhLKl4TghKRUMVY2QndMe/TNc8ZCO/SBDtDQGLdUowAIqGUQIJk4QRKEjbHGiHF0Kkkb
	ssTiWE8H09QNuZwWRR85eCbezsFXR7izc2l8Wz8JgyHv/B3EUqnTEKNDmL32N1AHcrAcSI
	mz6nzP+67SteciLT+nVZFgYGAuATIL2UgbA4E/I23JKuFiecI4PRluLDgCXXUw==
Message-ID: <a8d62ed4-38c7-4ff7-a283-3708761d94a7@mailbox.org>
Date: Sun, 28 Sep 2025 18:56:48 +0200
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
References: <20250904172019.58e5f589@fedora>
 <4147d10f-fb54-4f1b-ac1b-58cf657a3aeb@mailbox.org>
 <aMk1CISrn2_p0qzJ@oss.nxp.com>
 <c34dc4bc-de12-42fc-aaf5-50474dc53042@mailbox.org>
 <aMoTtr9KmdrgDUiE@oss.nxp.com>
 <c1a45cfa-a249-4782-b5c8-0ee2d173fc97@mailbox.org>
 <aMrDKkIoZvAlBD8d@oss.nxp.com>
 <609113fa-6af3-4e7e-b47a-45b3152d8581@mailbox.org>
 <aNZaatnVRRkaPrnD@oss.nxp.com>
 <32fffaad-7738-4fa6-80cc-2f8eba7ca099@mailbox.org>
 <aNjwyIgs9fzWiprq@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aNjwyIgs9fzWiprq@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 09c0d8297a0a9a440e3
X-MBO-RS-META: axcuj6fk8qs9i65ufsbua5pb77z3odbx

On 9/28/25 10:24 AM, Rain Yang wrote:
> On Fri, Sep 26, 2025 at 03:32:46PM +0200, Marek Vasut wrote:
>> On 9/26/25 11:18 AM, Rain Yang wrote:
>>
>> Hello Jiyu,
>>
>>>>> as the 0x4d810008 is a write-once register and whose operation has been moved into the SM side,
>>>>> so please drop the reset change.
>>>>> can you also change the label of the gpu node from gpu to mali like "mali: gpu@4d900000",
>>>>> as the internal driver use mali label to control the thermal up/low limitation.
>>>>
>>>> I updated all of the AHAB container, imx-oei and imx-sm components, and the
>>>> reset controller is no longer needed indeed.
>>>
>>> thanks, please update the gpu node label if possibly.
>>
>> Which label do you refer to, and which one would you prefer to have there ?
> 
> "mali: gpu@4d900000", not "gpu: gpu@4d900000".
All of imx*.dts* use gpu: or gpu2d:/gpu3d:/vpuvg: for the GPU label.

I see allwinner does use mali: label, but maybe it would be better to 
stay consistent with the i.MX labels ?

Also, variants of gpu: label seems more popular:

linux$ grep -hro '[a-z0-9_]\+: gpu@' arch/ | sort | uniq -c
       3 adreno_gpu: gpu@
       1 bb2d: gpu@
       1 gpu2d: gpu@
       1 gpu3d: gpu@
      80 gpu: gpu@
       4 gpu_2d: gpu@
       1 gpu_3d0: gpu@
       4 gpu_3d: gpu@
       6 gpu_mem: gpu@
       1 gpu_reserved: gpu@
       2 gpu_vg: gpu@
      17 mali: gpu@
       1 v3d: gpu@
       2 zap_shader_region: gpu@
