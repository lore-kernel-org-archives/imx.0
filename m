Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEC22E401;
	Sat,  8 Aug 2026 03:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786161300; cv=none; b=Ph7LqH/5PI5UyFH1cih9zMXKOaTczzvRYGCC/fOBArz+T7l2H/pHPeZYvmmhlEJZio0d9wooKjyLYhm0dJ3VXf7dDghDkp8Glb4l0pf+IiWaAoS38xB38EFoHIernmls1JkxqRusMaukQoonRGd8CgMjGFq3hk/3i35qGrnbkic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786161300; c=relaxed/simple;
	bh=Y5Tb4VjOhPaU8iO7YoIz9k5SwPn/b86ZTQJA0cIONOQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aEYArIEvQhC6rMSa4lw/45f1CImyZyqFlvnatZ1pV+uyXbKpbQb/gCREEQgGPIECcuOpZhMw4R2KLoSetVSAGexTaRJ2M8FRACGZJU0njb5dOjG1rGelxFb6ZLxpXIxaj9YOmNKmaq8nF3i+68d9FlgGM5zuejWJaxypuYMtXSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GYaC1ly+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GYaC1ly+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D571F000E9;
	Sat,  8 Aug 2026 03:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786161298;
	bh=Y5Tb4VjOhPaU8iO7YoIz9k5SwPn/b86ZTQJA0cIONOQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GYaC1ly+OBBxZI5/PfssAwdxk/r2lFnWU0WPOSYp5M3g8NL4ugWctr6fqPuKqEgYj
	 h/ptnP4/WMmZKikAy8dHpZo7PVIfb12ClrEQvS/pDGu8qQH4LrW+BbMGHJu47vVtNB
	 WT0ptRGH7VEHmEkRSweMBu72hCnM+8Y9K05CwX0zylvXVkQmnTipZUuOs8UV3WPjZt
	 ZAmx9z+F+C0JWU0A9GfTTRGXQZR7TysO5klpdvqREX9ZR1+DbYTT8fWGUzEOk8T7ut
	 reiYBqe1JGpFUB4dDY7Mbjwrxkp3oyPk8TVbuxLUFLLK4z5LQrnGjTSdRkP/1R60kb
	 ksK3Ktc5pitxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 3/4] net: mdio: make device map changes
 hotplug-safe
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260806-submit-mdio-of-dynamic-v2-v4-3-4beb0c50d5ba@gmail.com>
References: <20260806-submit-mdio-of-dynamic-v2-v4-0-4beb0c50d5ba@gmail.com>
 <20260806-submit-mdio-of-dynamic-v2-v4-3-4beb0c50d5ba@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 03:54:57 +0000
Message-Id: <20260808035458.46D571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The 'dynamic' removal flag is hardcoded to false across all API =
boundaries, rendering the dynamic firmware-node reference dropping and excl=
usive firmware removal transactions unreachable dead code.
--

--- Patch [3]: [PATCH net-next v4 3/4] net: mdio: make device map changes h=
otplug-safe ---
Note: The format of this review has been altered to use a free-form summary
rather than inline patch quoting due to automated recitation restrictions.

commit ea45b70c0d34732ca4b03fdec7b5cb7a401e48fb
Author: James Hilliard <james.hilliard1@gmail.com>
Subject: net: mdio: make device map changes hotplug-safe

This patch serializes device-map state and reserves addresses while
registration is in progress to make MDIO device map changes hotplug-safe.
It also adds logic to handle dynamic removals and overlay node cleanup.

[Severity: Medium]
The commit message states that the patch will "Drop a dynamically removed
device's firmware-node reference after device_del() so it does not keep an
overlay node alive."

However, looking at the implementations of phy_device_remove() and
mdio_device_remove(), both functions unconditionally pass false to the inte=
rnal
__phy_device_remove() and __mdio_device_remove() functions for the dynamic
parameter. Similarly, bus teardown in mdiobus_remove_devices() also passes
false.

Because this dynamic flag is always false across all public API boundaries,
the dynamic cleanup branch inside mdiobus_finish_remove() appears to be
unreachable dead code.

Is this intentional, or were there plans to export a specific dynamic remov=
al
API that callers could use to trigger this logic?=20

Additionally, since phy_device_remove() and mdio_device_remove() return
void, if the dynamic flag were ever set to true and the internal remove
function returned an error like -EBUSY (for instance, if the PHY is still
attached), wouldn't that error be silently ignored by the void wrapper,
potentially leaving the device in the bus map while the caller assumes it
was successfully freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-submit-mdi=
o-of-dynamic-v2-v4-0-4beb0c50d5ba@gmail.com?part=3D3
