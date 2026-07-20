Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B289E1F30BB;
	Mon, 20 Jul 2026 21:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784582030; cv=none; b=H4GCVaUpWtynHTozaj8WASlNa/TOYbY4ooV46yae+YbdEYfDQJ7EYQhQ/Ay3xx4ljKKEAktaseBGPL8OVHOtuIUiGdLPCQNCQFlIgLBiSPtqHE6sVRv2KzTwPTjdwcfrRw4H8j6mB9yF0Eewn5xA9AWKWDGpFUwx1jDZulDbOYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784582030; c=relaxed/simple;
	bh=N2lKQNmrBE6ZssJZTJv3Y8xCohAFrAWr12QySnsg1HI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/FGkMOxkPiGJj96wKcah09G5F7g06hFguTLJPFHPVQhaws68YQ734v4VSFCyTIAHT8AWdS9UevzNmlyUjSyWQ0t1v2UYuvSPLJO8jcnH8YZaIhl73lNXUf0uRH6cyQsAkEfINde6rLE8NQR4fPc87LDqKG9uFNPyRhIXPUXtSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MpsxUPlU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MpsxUPlU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35AA61F000E9;
	Mon, 20 Jul 2026 21:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784582029;
	bh=I4PWJsSe0XvNCFfqfX/zEHqiOjItfF8SBX+LM42jmmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MpsxUPlUJquEGaj+w5wI8btQwsS5LgPVDiYP2tbAGcb5FwnmrRKyAxkho9+6iDofS
	 cT7KN/tszvMy6Zari3KlUo45zlyyTg/lvYPg52VKYQ6pE6cZJTVmJRGmJiLta88QgW
	 0UWtznUbLsImOAt5xnGBSi+4OGPdSWs4pKygqZHw1PHEWvhQeHRVhev0I8h7wIpWT5
	 QcKEPL/WzgxbFOsaTGOLFrY+DYjnz1s7X+90pLzCCnNoyTxak7Xd35aD3oNv3DuVSl
	 Jg/iK0CKyP4us4Kex3WZf8jGbqlDSkplvRHbZLPGlJhHvS8dPcQkTUx0z+hjreTt1d
	 QaqiTKuc/jzkg==
Date: Mon, 20 Jul 2026 16:13:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Frank Li <Frank.li@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] regulator: dt-bindings: Convert ltc3589.txt to
 yaml format
Message-ID: <178458202695.4139005.526773549242288315.robh@kernel.org>
References: <20260714160147.1641379-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714160147.1641379-1-Frank.Li@oss.nxp.com>


On Tue, 14 Jul 2026 12:01:45 -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Convert ltc3589.txt to yaml format.
> 
> Additional changes:
> - Add interrupts to match driver code
> - Require lltc,fb-voltage-divider property ^(sw1|sw2|sw3|bb-out|ldo1|ldo2)$
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - Add interrupts to match driver code (report by sashiko)
> - Require lltc,fb-voltage-divider property ^(sw1|sw2|sw3|bb-out|ldo1|ldo2)$
> (report by sashiko)
> ---
>  .../bindings/regulator/lltc,ltc3589.yaml      | 149 ++++++++++++++++++
>  .../devicetree/bindings/regulator/ltc3589.txt |  99 ------------
>  2 files changed, 149 insertions(+), 99 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/ltc3589.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

