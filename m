Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794329945;
	b=w+G334IIwlJQAHBinYzniPhczeNSusmiZmCiy8TvwFBALeOlytD3+42WJnKx++w9/n4m
	 kNJm6YENTVnIhnnSCGtf9EgO0yDrBY/yqw5TF/pIQFs8FxBNA2rrHFkotlvJmuNCdwA7w
	 CMnDMcMXPxWX80mHvEjwVXllHWKMiQM5qyxbZnLWL31a1QUS2W71HD0/cdCoQkB0w4ae+
	 qkLBP3/8aMgEocknqRoeA8GW8jjC+tCPWJfPQSjn+LS8WjS4X7D0timJyejic86/5eHEF
	 gd6bSOc6kF/I2rrWv7QBB3Fj1sVlY0xQC5+2ojheNEql+CKSctStDptMUzKxLf1/zCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329945;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:Date:
	 From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Correlation-ID:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:
	 X-Source-Args:X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:
	 AntiSpam-DLSP:AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:
	 CFBL-Feedback-ID;
	bh=6a36y4SRwgMeQN1J7eFZmKIcS5P354+mS0JMqXH3AcM=;
	b=0DOdkDquyASEtae/vDcSXjyagy33hk6ldr1wmLU8ymzviQBI2dxeUcghYixWqdHWrs9N
	 krUMgK7qXCa5fu1HVgdpzzYgmHrrD8MPDCe9Yi4PUWTc7QAsWBzcD3KU+qJ6G73G6JlnW
	 oy37X45c/x79DPFgmvrZVV7xIVXOJkt8ntNVMH1yRiSwsDtJpWKECrTac3Hg+zXFBWRYt
	 vmz8fszy07391talcrJXPIwtBrpmXvTT1SVdS51oLULxeT2Y1tf48WZpy3jIxncT/pmy8
	 GqfJq5z+6rN+PfsQvkUxeg5ESWOdlWs/Hza/wZB0+6pXe8bly2ux/hT0OrHxHlxTOJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=0VGItgkp;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=qrob+Jmo;
	arc=fail smtp.remote-ip=185.56.87.13
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AB260A2608
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 16:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77AB260A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=0VGItgkp;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=qrob+Jmo
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; s=arckey; t=1794329944;
	 b=aFJda5LO1L+uz88RNC7ZiskLxjGPc6LecOQCWb+VgDqWf1arMk5KcIcm53RqxgUbTHDWQ3g3fl
	  adrZ5eW/RZnl6QA0fKIhDfw9vL+NLYxdbDQLs9LvlQG0VDedvojcvBUjuLW/Wwp+lXTYD0NDJV
	  WEQhD8vtBHj/oJ1V2sxpC26pVyHEYXR3bsRPDTKkNAFSWnBPX7tcO+DOk9uwOpt3zUfgj0yLoW
	  s/HS5ZwS9zirIxPgMQC8sG0zGpLMXgybUe8rDrimURgGKigxtrHR0UwMC+Z8A92hEx+670ATYU
	  GWi3BSV14z1RdJGJSKIGVv88NuFfuAyJz9eYS5xwgCbfnA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com; s=arckey; t=1794329944;
	bh=6a36y4SRwgMeQN1J7eFZmKIcS5P354+mS0JMqXH3AcM=;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	  In-Reply-To:Message-ID:Cc:To:From:Date:DKIM-Signature:DKIM-Signature;
	b=RRsVS8WHgvDL7prEsCK/EDQmjk2N+7a2NFJz6xN0CpuVGFweNyVhC5CPACQ2Cj2HTaaTA/rnZT
	  rieCE6VpQKsI274UuyYVNVwuZUbq4rtAgrBP3GHn3jWA2sGPcWbr0Xx3c/k32NMNOnS9Ko+Vab
	  WC4fCgGbPeYhMZlhoI+rVh8r0PHIDKAo7/HZ7f+ztpYFICqhnEMA+4eQ3H4h8YJxOFbK41d1qR
	  23lwU7Im5UUbfz7ox71nIAyrCfCfgL6SFNY6l9Wkm4yJNR4eQJYsTikN2VbrOFQo1CoEZ/zckC
	  cm6XByI5jA5U70TneLP1FzGIoQLHBQx3PhKF49askc9M/A==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Message-ID:Cc:To
	:From:Date:Reply-To:List-Unsubscribe;
	bh=6a36y4SRwgMeQN1J7eFZmKIcS5P354+mS0JMqXH3AcM=; b=0VGItgkpBoDWqdjoh1u/hGpAvo
	PgmCM1jZLjdrmcgKb8DNfGdDeAoJNrnctTrkbS0iVHlw35RKKFj4qJCtlhbqky06ItYYm9h9RVrSF
	zN/TBEnO7fLdNDQdp2Y6LbGvLggvULtkJ8My6wxFD63DiNrfZIBpVyRrN6JoQJv6ZJbY=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQpBQ-0000000BuHB-1TCF
	for imx@lists.linux.dev;
	Tue, 10 Nov 2026 16:58:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=6a36y4SRwgMeQN1J7eFZmKIcS5P354+mS0JMqXH3AcM=; b=qrob+JmocH4xrMNATvmA7uR9iO
	PFT1HYk++mL+WoYIIKR/e1076P3KQDF0HyphTZqavIj/MZiTDl7fLT4v5NYbph2DKjeLtI9AVWch+
	GWsJlSro+N+mTPVWO2CP27m63QfdVhPy9xUI1HQPEKESYGlj/IUo+7h4mZNOJ20saiKA=;
Received: from [109.54.113.250] (port=16151 helo=dummy.faircode.eu)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xQpB8-000000007rc-1PpM;
	Tue, 10 Nov 2026 16:58:38 +0000
Date: Tue, 10 Nov 2026 17:58:35 +0100
From: Francesco Valla <francesco@valla.it>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
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
Message-ID: <cea97670-facd-48b0-97c3-651ca9d71c75@valla.it>
In-Reply-To: <avM8OYHxB4nAKCnb@p14s>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it> <20261102-remoteproc_virtio_map-v2-4-26b300e01c62@valla.it> <avM8OYHxB4nAKCnb@p14s>
Subject: Re: [PATCH RFC v2 04/11] remoteproc: report VIRTIO_F_VERSION_1 for
 non-rproc-specific vdevs
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <cea97670-facd-48b0-97c3-651ca9d71c75@valla.it>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 59a9232175175cbd16efd587f3e56faa
X-AntiAbuse: ID - 59a9232175175cbd16efd587f3e56faa
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xQpBQ-0000000BuHB-1TCF-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-ssp3.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hi Mathieu,

10 Nov 2026 16:46:09 Mathieu Poirier <mathieu.poirier@linaro.org>:

> Hi,
>
> I started reviewing this set, making it to this patch.=C2=A0 I will conti=
nue tomorrow
> but due to the KVM forum later this week, I may not finish before next we=
ek.

Take your time, I'm in no rush to have this merged.

> That said, I applied the first 2 patches so no need to include them in th=
e next
> revision.

Ok!

>
> Thanks,
> Mathieu
>

Thank you!

Regards,
Francesco

> On Mon, Nov 02, 2026 at 12:26:41AM +0100, Francesco Valla wrote:
>> There is currently no way to report the VIRTIO_F_VERSION_1 using the
>> resource table alone, as the per-vdev feature array is limited to 32
>> bits.
>>
>> Considering that the VIRTIO 1.0 specification is now ~10 years old,
>> always report the VIRTIO_F_VERSION_1 feature for virtio devices that
>> are not specific for remoteproc usage. These latter, which as of today
>> are rpmsg and rproc-serial, are excluded to avoid impacting the existing
>> usecases, since VIRTIO_F_VERSION_1 changes the semantics of the
>> communication (e.g., the configuration space is assumed to be
>> little-endian rather than follow the device's endianness).
>>
>> While at it, replace BUG_ON() with WARN_ON() and return an appropriate
>> error in case of features that would overflow the 32 bits limit.
>>
>> Signed-off-by: Francesco Valla <francesco@valla.it>
>> ---
>> drivers/remoteproc/remoteproc_virtio.c | 28 +++++++++++++++++++++++++---
>> 1 file changed, 25 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc=
/remoteproc_virtio.c
>> index c56d3330adfe..f1b362158a9c 100644
>> --- a/drivers/remoteproc/remoteproc_virtio.c
>> +++ b/drivers/remoteproc/remoteproc_virtio.c
>> @@ -16,6 +16,7 @@
>> #include <linux/of_reserved_mem.h>
>> #include <linux/platform_device.h>
>> #include <linux/remoteproc.h>
>> +#include <linux/rsc_table.h>
>> #include <linux/virtio.h>
>> #include <linux/virtio_config.h>
>> #include <linux/virtio_ids.h>
>> @@ -27,6 +28,11 @@
>>
>> #include "remoteproc_internal.h"
>>
>> +static bool rproc_virtio_rsc_vdev_rproc_specific(struct fw_rsc_vdev *rs=
c)
>> +{
>> +=C2=A0=C2=A0 return (rsc->id =3D=3D VIRTIO_ID_RPMSG || rsc->id =3D=3D V=
IRTIO_ID_RPROC_SERIAL);
>> +}
>> +
>> static int copy_dma_range_map(struct device *to, struct device *from)
>> {
>> =C2=A0=C2=A0=C2=A0 const struct bus_dma_region *map =3D from->dma_range_=
map, *new_map, *r;
>> @@ -268,8 +274,17 @@ static void rproc_virtio_synchronize_cbs(struct vir=
tio_device *vdev)
>> static u64 rproc_virtio_get_features(struct virtio_device *vdev)
>> {
>> =C2=A0=C2=A0=C2=A0 struct fw_rsc_vdev *rsc =3D vdev_to_rsc(vdev);
>> +=C2=A0=C2=A0 u64 features =3D (u64)rsc->dfeatures;
>>
>> -=C2=A0=C2=A0 return rsc->dfeatures;
>> +=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0 * All non-remoteproc-specific virtio devices are ass=
umed to be
>> +=C2=A0=C2=A0=C2=A0 * compliant with virtio specifications 1.x; there is=
 no other method
>> +=C2=A0=C2=A0=C2=A0 * to transmit this capability from the remote proces=
sor to the host.
>> +=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0 if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features |=3D (1ULL << VIRTIO_F_VE=
RSION_1);
>> +
>> +=C2=A0=C2=A0 return features;
>> }
>>
>> static void rproc_transport_features(struct virtio_device *vdev)
>> @@ -285,6 +300,7 @@ static void rproc_transport_features(struct virtio_d=
evice *vdev)
>> static int rproc_virtio_finalize_features(struct virtio_device *vdev)
>> {
>> =C2=A0=C2=A0=C2=A0 struct fw_rsc_vdev *rsc =3D vdev_to_rsc(vdev);
>> +=C2=A0=C2=A0 u64 features;
>>
>> =C2=A0=C2=A0=C2=A0 /* Give virtio_ring a chance to accept features */
>> =C2=A0=C2=A0=C2=A0 vring_transport_features(vdev);
>> @@ -292,8 +308,14 @@ static int rproc_virtio_finalize_features(struct vi=
rtio_device *vdev)
>> =C2=A0=C2=A0=C2=A0 /* Give virtio_rproc a chance to accept features. */
>> =C2=A0=C2=A0=C2=A0 rproc_transport_features(vdev);
>>
>> -=C2=A0=C2=A0 /* Make sure we don't have any features > 32 bits! */
>> -=C2=A0=C2=A0 BUG_ON((u32)vdev->features !=3D vdev->features);
>> +=C2=A0=C2=A0 /* Make sure we don't have any features > 32 bits except t=
he expected ones. */
>> +=C2=A0=C2=A0 features =3D vdev->features;
>> +
>> +=C2=A0=C2=A0 if (!rproc_virtio_rsc_vdev_rproc_specific(rsc))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features &=3D ~(1ULL << VIRTIO_F_V=
ERSION_1);
>> +
>> +=C2=A0=C2=A0 if (WARN_ON((u32)vdev->features !=3D features))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
>>
>> =C2=A0=C2=A0=C2=A0 /*
>> =C2=A0=C2=A0=C2=A0=C2=A0 * Remember the finalized features of our vdev, =
and provide it
>>
>> --
>> 2.56.0
>>

