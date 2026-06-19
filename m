Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A683C5DBA;
	Fri, 19 Jun 2026 15:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781884357; cv=none; b=tVS/QC0ciUmYMVb9O96xOes7br6gLHlvcnKmkypzow7ZZj5j0JSErrhBt0o/S8mpR8uYifU49QelXYtqTecfcA66zKlPJiGBWUyGzuT2BkXYS0E4y60KA/K3l2kMGTHRZbULnYrV7ZlbCp0gyFtaoREoyC3+lq9/TpdIHrICjbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781884357; c=relaxed/simple;
	bh=3JiLl2mZrBW5NPQLXyot3s3hPUe2+Gw7u8g2zluv+ck=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e8FlpInn7E8CQRLGASzCD9XshW4fVBY6aDUMhACe1Xig5IkQ0EuQ1cpffbU0n45lWRdVB/pR3UJlBFvzGVfCdq/A+zSCtuoHWNinQzI6xKluXZ2zIO/0eQGMUI11AQTg4MzhJx7ffzW3LD4TjgrLq5cbSrfnOgDgmt8Yd9LN7Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3XhApr1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3XhApr1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8AA01F000E9;
	Fri, 19 Jun 2026 15:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781884350;
	bh=oUsohkrRBMvfwv0K1GYcl1PFGWrY5mgcXHanVHewsQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l3XhApr1aSqQCYkWLQMVSzZa1ugBfC3e7KGJATbRxTJJQqX1WLJYrZ92fEu19PtBt
	 ToBdLd5uHwXi5GKuGzmPXh/mWgpcOXWe2508bcqRrTKIHKHIehBAkIEXgddSTfo2Hx
	 QPae8iKhPdZ2W+0gwV+6Bpjen/rHlcigrTkY2mgTlbcfdCG27GbZvaPX9BL+08yzts
	 a5gZZY+hD1Ce26vnJMmj7Vtxdsfn0dBza+6XiPWMeN3V+EFXIPkcdqzfh4ji0aKjWm
	 17lS+0thlrjNgtgrY4r1HKXi4E48P8KVy2jOFnwvKkRvJ/7CUpMGp8ACHW+9bp7JLG
	 16pAhjhGjo56g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/11] ARM: dts: vf610m4: Remove NOMMU platform support
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: conor+dt@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260619-dts_cleanup_arm_mcore-v1-1-0101795a2662@nxp.com>
References: <20260619-dts_cleanup_arm_mcore-v1-0-0101795a2662@nxp.com>
 <20260619-dts_cleanup_arm_mcore-v1-1-0101795a2662@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jun 2026 15:52:29 +0000
Message-Id: <20260619155229.B8AA01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incomplete removal of VF610 Cortex-M4 NOMMU platform support lea=
ves orphaned code and configuration.
--

commit 47df1414ffdd1b53077023f0d62226535c747e2a
Author: Frank Li <Frank.Li@nxp.com>

ARM: dts: vf610m4: Remove NOMMU platform support

This commit removes the device tree files for the obsolete Vybrid M4 NOMMU
platform to reduce maintenance burden.

> Remove the obsolete support to reduce maintenance burden and simplify the
> code.

[Severity: Medium]
Since the goal is to fully remove the VF610 Cortex-M4 NOMMU platform
support, does this patch leave behind orphaned configurations and code?

There appear to be several remaining references that might need cleaning up
to completely simplify the codebase:

- The dedicated arch/arm/configs/vf610m4_defconfig file
- The fsl,vf610m4 compatible string in the vf610_dt_compat array in
  arch/arm/mach-imx/mach-vf610.c
- The fsl,vf610m4 binding in Documentation/devicetree/bindings/arm/fsl.yaml

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619-dts_cleanu=
p_arm_mcore-v1-0-0101795a2662@nxp.com?part=3D1
