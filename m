Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C61D39793E;
	Wed,  2 Sep 2026 06:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788331708; cv=none; b=sp94k/fxhL+0tfDl4mM+FFffpJx5bCgKyZ/6kCytksuoUN2oo0tBuD1xYlaPl6ZGZcsgkV93Eu0HrAVPYmeA7ti2s3n8jVPtDAa5O64H8VRVbb6L7Cd6N+/JWwR2AicKnmcd4pldwzOd7NeYTOGGoiRkbIDgNaSEFE17Us0t3As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788331708; c=relaxed/simple;
	bh=2LLwpUks3gQxsZ3/f3rmgnddaSxtRyMROygyinoDiZo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jvJ3x/+V2BwwCxvVaILJ528b7T2jVNKkWmm+Cam0xDi2Lz9qM3DuMuNDDyYDGQyU/ANE14lMMbBPBn5QyWJVOOEmUTmXwx22brMshyKx0ORYCb84aiBcYNsiKmB09U7HIOqSEF6WAKZ1NTI3J/4RL7td+3hpyl6KF61uxArpPW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YaOYsPJU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YaOYsPJU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B4F1F000E9;
	Wed,  2 Sep 2026 06:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788331706;
	bh=2LLwpUks3gQxsZ3/f3rmgnddaSxtRyMROygyinoDiZo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YaOYsPJUadoILWmznNV7eDuGjhqprlyw94hEPADPJQZnaoWC4DxxcoBhyXplm2Mbe
	 wqVr/q9hOl+YTRbqydx+hsRPpv7zw1mkGKlFNYABy4MCC1CeVHBmFKDEjX4hR2L65X
	 pxFOEve/6TrtvAgV5mrs1AOY5d8XVC6N5XsaU5KDgPaPLzJJhqNAJBu/MgcaIO8RQZ
	 NH8bCRpSzq+nJ3NzAd8M7QX71BYzbkl6udjpZiOzLHCtwPNwj3H6rIvwp53KkFR3+T
	 5XcoUfzT4dDjFRef2gKiwNLw5ps9CZyik9JR3pl8wotO3M/EXMH93m6SqEwL+ixo7N
	 ksYHNynBcW9YQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v44 6/7] arm64: dts: imx8ulp: add secure enclave node
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260902-imx-se-if-v44-6-104658bf941a@nxp.com>
References: <20260902-imx-se-if-v44-0-104658bf941a@nxp.com>
 <20260902-imx-se-if-v44-6-104658bf941a@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 06:48:25 +0000
Message-Id: <20260902064826.63B4F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Commit message inaccuracy: mismatch between the SRAM node address i=
n the commit message (`sram@2201f000`) and the actual node modified in the =
code (`sram@22010000`).
--

commit af8ee11fdbb0446f89343231545123f3615de2bf
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

arm64: dts: imx8ulp: add secure enclave node

This commit adds the EdgeLock Enclave (ELE) secure-enclave node to the
i.MX8ULP SoC dtsi. It adds a label to the referenced SRAM node and keeps the
enclave node disabled by default to avoid imposing reserved-memory requirem=
ents
on all boards.

> Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
> dtsi, together with a label for sram@2201f000 that the node references.

[Severity: Low]
This isn't a bug, but there is a mismatch between the SRAM node address
mentioned here and the node modified in the code.

The commit message refers to sram@2201f000, while the code actually
labels and references sram@22010000. Should the commit message be updated
to match the modified device tree node?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-imx-se-if-=
v44-0-104658bf941a@nxp.com?part=3D6
