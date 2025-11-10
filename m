Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826AB25334B;
	Mon, 10 Nov 2025 07:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762761201; cv=none; b=tm5jzH+92LOEsmEH1RRC/Jy2weMAuAFEZNmKfvi1JgR02sFV3op0ezIXC9hc0rTM3u9vKP5ibhAnwv0hcaS22jlDhuImgfCDjz+kEbblVDYEON1yP5mjuRwnxBYQ0c42IZBzJ/pE+G15sZBxQ1groP+JlX7T1RlSFvJOETySMh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762761201; c=relaxed/simple;
	bh=aD0bXMxM8CDFNwDaCde/4X7QKwASqM9PdFPOKWf2baY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FODcfAa2Zq+BrwVcoTPmENiQYeAQ/iok27GLIf0KUTmPvqLYtNhqIDvLyqsqDTmGwPl2/WzuCITjaAW6r1JRvWJG8JQFPM269klo/yqzPs8kmfm8moRpVSjqLo9cr4GIYUNSiNs/JC73im68gsylqGomDMIy+E5Lu1XvnG6uc/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hexuYCT4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hexuYCT4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D485BC19421;
	Mon, 10 Nov 2025 07:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762761201;
	bh=aD0bXMxM8CDFNwDaCde/4X7QKwASqM9PdFPOKWf2baY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hexuYCT4AMkN1E6qvheK7tISxjHWRQ4H/TNG/8ZbbB+/RdyRFtKW9X5ECOzbZ9/6w
	 dwPqPtFd4IcRWwiYZXfvrUFPg/8bmKLhS7A6fnyWMmulvoBl9KHF/k20dbmse+gp3H
	 s8ojxcNbRZ8U1VTKpqZUM32zWNDYRVN5FlyxnM44duK8lcJCWmQjvWBdmKzU5annFb
	 66geaZnQb2qxwDXwpq8OSQ7UB0pF2Ow6YUrXy/Gue+aZdyMhcoj5xidZYAhSVDlrCV
	 S2c9KP2XfH2UMZYD5YjDXVU5I/8feh9AT+Tg4Txa86WhCToi3/FcrBVHOHYColYLyu
	 TcQYEYc68EvFQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, alice.guo@oss.nxp.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alice Guo <alice.guo@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20251020-imx94-v1-0-0b4b58a57bf9@nxp.com>
References: <20251020-imx94-v1-0-0b4b58a57bf9@nxp.com>
Subject: Re: (subset) [PATCH v2 0/3] Add i.MX94 OCOTP support
Message-Id: <176276119135.18911.11093560408618836361.b4-ty@kernel.org>
Date: Mon, 10 Nov 2025 07:53:11 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 20 Oct 2025 18:50:41 +0800, alice.guo@oss.nxp.com wrote:
> This patch series adds support for the OCOTP controller on the i.MX94
> SoC. The OCOTP controller provides access to eFuse regions.
> 
> Tested on an i.MX943 EVK board with successful NVMEM read access via
> sysfs.
> 
> Changes for v2:
>  - improved commit messages for each patch
>  - added Acked-by and Reviewed-by tags from reviewers
>  - updated the efuse@47510000 node
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: nvmem: imx-ocotp: Add support for i.MX94
      commit: 294e0add7bb8eca991f7e8d064c71acfffd10462
[2/3] nvmem: imx-ocotp-ele: Add i.MX94 OCOTP support
      commit: 9e8d7c3115f4eceaae2d5282518be78bcb7ca188

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

