Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B8C41C302;
	Tue,  7 Jul 2026 13:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783430694; cv=none; b=EmfGwyXhj7jyD/ChBWidtGAU0QFeiqIpG6HcOgPYq+I10RPFuap/oiz2ObF5G1lOPfk1t3RRDZcWMxWGJSD6Iuw4pwDuejqSLL56V8mOvikgUXppJdkQq634La4/vuLfeKLr1IkG7LRIW+jl/n70c0ub0f3jxT5zuLi2qMWZ8KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783430694; c=relaxed/simple;
	bh=mik3rFC3S686GGVYxCe4iQl8MyFoTyiBjYiE1BsVy0w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pywVusQB9Tp0vSiQT5aKKAX65HoDe9XChCk8VZxl4xXaoLNUerhGFOCow2SrlunBg4r6hFcdWcsHIP8eSVI+klVJPH9BLnbBOIDR4bHpBvgiY4CCwTcBzGdpYr9idEqIJnH0nVts4zcH/OvF1/tllVQgxE+HtiZdgfj38xPeayU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jl2fsLFz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jl2fsLFz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A63C21F00A3A;
	Tue,  7 Jul 2026 13:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783430693;
	bh=mik3rFC3S686GGVYxCe4iQl8MyFoTyiBjYiE1BsVy0w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jl2fsLFzm5+RKXMngpDLMQWun/cO2fyq/IkGWGC512KM1EvbouV7Uto+3VcOhCKrk
	 FUbU/PPqAAcyBzvrTbl3ls2jFC/S2DEsWHl1Jaw4I8jBHqIvqLI36vhYhLw04CYTSp
	 wGQlNHE7wtTBhV4Pi+P7+fLdtpdANCRVcDlW/l13KpEDi3ywjwTePArkDNfysx6GnJ
	 JoQma0zE/KnI0AdQuV5ZD6kLaMQgtYpYD6hAxEn727yG6dcVFE5kVt6L4ZZUWu2AVc
	 AWq9Uh0L7OEntqSZYbdHz1eil7hGcpaapihq/MrdropWCVk88o0cyxB4xn48dfodCI
	 N59GSQ90skFPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/20] of: platform: use
 platform_device_set_of_node()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, dri-devel@lists.freedesktop.org, lee@kernel.org
In-Reply-To: <20260706-pdev-fwnode-ref-v3-6-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
 <20260706-pdev-fwnode-ref-v3-6-1ff028e33779@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 13:24:52 +0000
Message-Id: <20260707132452.A63C21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

> Ahead of reworking the reference counting logic for platform devices,
> encapsulate the assignment of the OF node for dynamically allocated
> platform devices with the provided helper.
>=20
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-pdev-fwnod=
e-ref-v3-0-1ff028e33779@oss.qualcomm.com?part=3D6

