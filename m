Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF7943710F;
	Tue, 21 Jul 2026 09:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784625963; cv=none; b=uQwvnIiTF4Ny7++i76uBxPLQjdoeXIUia7O/1meNDZOI90FRvFlnAETobcgPyY5buUHF6ZKL6N51TybL6WUyyna51BTNWsyMKNjXZsPAMuYgVNeEW/EtTUxalg+t4nHj3pBfpV8dhzpDLMiQ273Qjsm3o5V6wa6j3rnmPyupth4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784625963; c=relaxed/simple;
	bh=i/wgk+8jiWTi/lGjb0gj2oxfYn5MjBw364RegSWiyyM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QkrEvojPpo2o6MmLpj0rvs8LODKehSfY6BROpRTjTfhr67jhpGh7bocViunwymoHbFWV0S0oPIEJ5epyyoCuiFCXFSexUmcJgUeF+bKm9QVQRo1/UQy8uQYX0VD5jmFdva65AzxjYzDAnGJpVrXAkjZ0cjyVGg0gTNWf95YG0zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IvTQoRzM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IvTQoRzM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E931F00A3F;
	Tue, 21 Jul 2026 09:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784625962;
	bh=i/wgk+8jiWTi/lGjb0gj2oxfYn5MjBw364RegSWiyyM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IvTQoRzMpiuIHqy8tkZiIeey07IRGrmXg9MR/M8Zx2BogjOWfUufQvpu7myVdg5/L
	 LxJyiVxHyeP5pPoWWw9xYWqZpt0hWz8NeuEQGiyb/J0jtxmiGgI+1SFHlx5NUsKD5E
	 GxzD8e6rwBqKad5P4o+DgriGdP62lQXW4JW1Q3jgc/BDCTIe3GgbV/UBdUNhznWotZ
	 bHIY459jCQ9YKgCIn8Vk9EQRe4pQcvs0S8yWLTtRtfbmViYjFHdFEhtroV+3ipwS9u
	 nQkFYBA7w+h7wYuPOuK8x4+tBPaEt5pcntQoSSh1VUyIrv6IM6NIs7v1sj4pPQ9XK9
	 lXY0aMXsW8ncw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/8] i2c: pxa-pci: use platform_device_set_fwnode()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: lee@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, mfd@lists.linux.dev
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-2-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-2-2dee93f42c54@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 09:26:01 +0000
Message-Id: <20260721092602.10E931F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

> Prefer the higher-level platform_device_set_fwnode() over the
> OF-specific platform_device_set_of_node() for dynamically allocated
> platform devices.
>=20
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-pdev-set-f=
wnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com?part=3D2

