Received: from mail-24420.protonmail.ch (mail-24420.protonmail.ch [109.224.244.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E47B272E7A
	for <imx@lists.linux.dev>; Fri,  8 Aug 2025 10:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754647944; cv=none; b=InCZLFK1BIcoxln/knngClJAcdnYbIW777ZTAiZZC/RqRJPZJYw6vFyP/uKWJUHh+abP65vijB4w40HNWwmanTX4h8V3pMlRZ0YeCpT50xgqZ1goGXbrZiCUc/CJ6u7N+eSX9FSCpTGyp+IUoQ9StOPpHLbXhFAFHTK5r62HKYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754647944; c=relaxed/simple;
	bh=h0zIQbSvyxqDSyFVDGoSNiPPz+mQYBdiYh2opvFecX0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RspGL8YUYxe7MZyByXfS00EhGdrv7O6aC2ft7YCPDBqYwQ1zmwzuczIH16OOeQyop2sK1q8GgSUDzk3ZI8Ma7OHFWFhKjkMQbE5Vko1oQMR6+lWqP2UOQrRfJeMBBvBe8nrulbNXgTZUUB84VnIQ5rbIwN3sUNqid8LjjjIYQ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=froTg+2G; arc=none smtp.client-ip=109.224.244.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="froTg+2G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1754647933; x=1754907133;
	bh=h0zIQbSvyxqDSyFVDGoSNiPPz+mQYBdiYh2opvFecX0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=froTg+2GHOGPNLELm2mc2cAxgrgZ9C1WYyIMFQjOhJIMCARoRFdN4cs8PqPzNWmxp
	 5LFBHXCDa5Jn0sq+VA3VrY87ydwT7f6Xj/4m6mKbI0dAiNsglCcHWb170/PAn4Bncq
	 AexVS+psvWoi/msrr1iY+BvDFWDefAwt5ERJX8j1wYLPybumZ4JG5L1zb0wWT7Q3AI
	 5N9lWjxQ0hHqfro8HSzkk6cBLl9bHZXu1kzp4UV44sQZ08uqB9fw515Mui0R3+tv3E
	 2zc5W4C1KzzmlSQhx6Z3kp5x56gSFAzl2+DVA7irhuYmAWlXzaqEQPI1hqQOXUF5jr
	 8MRZ4LJlU95aw==
Date: Fri, 08 Aug 2025 10:12:09 +0000
To: samuel.kayode@savoirfairelinux.com
From: Sean Nyekjaer <sean@geanix.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sre@kernel.org>, Frank Li <Frank.li@nxp.com>, imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, linux-pm@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, Abel Vesa <abelvesa@linux.com>, Robin Gong <b38343@freescale.com>, Robin Gong <yibin.gong@nxp.com>, Enric Balletbo i Serra <eballetbo@gmail.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v9 0/6] add support for pf1550 PMIC MFD-based drivers
Message-ID: <znrv5235mga6ns4oue63o2acwmj5gge4c2mr32m7pui4lkamji@cu7zk4skmqkg>
In-Reply-To: <20250716-pf1550-v9-0-502a647f04ef@savoirfairelinux.com>
References: <20250716-pf1550-v9-0-502a647f04ef@savoirfairelinux.com>
Feedback-ID: 134068486:user:proton
X-Pm-Message-ID: 0efdb6af94b748956b6be047e167a11300340c63
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 11:11:43AM +0100, Samuel Kayode via B4 Relay wrote:
> This series adds support for pf1550 PMIC. It provides the core driver and=
 a
> three sub-drivers for the regulator, power supply and input subsystems.
>=20
> Patch 1 adds the DT binding document for the PMIC. Patches 2-5 adds the
> pertinent drivers. Last patch adds a MAINTAINERS entry for the drivers.
>=20
> The patches 3-5 depend on the core driver provided in patch 2.
>=20

Please add to the whole series :)

Tested-by: Sean Nyekjaer <sean@geanix.com>

