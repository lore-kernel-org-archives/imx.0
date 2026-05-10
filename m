Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EDD3815EA;
	Sun, 10 May 2026 12:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778416347; cv=none; b=Pa6gCUqBpnCiYguteJBb0x/nJsM92xOfS51w87oTDrKKyssZOVDE5fWHel3+zQcYmIHlf50gss+VmRHueIydjS/49L5jojDTbzbz+VMoxPkoikefiWiQnIYRhqs6rT0gt0ahkhW1uD/rFD1/dBQp+G7SewUcwuI3XkXSHmICXLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778416347; c=relaxed/simple;
	bh=t7e25Wkq29joVUcS4ay/9eBhaqMriKfIr+VgmjLvpY4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t6sAXGFG9/utaqtNp9/TnKjVPon+tTtQBlmNZ3sd/GFsPhxKvxFux3ybi1f53XgZ3cGA6kfzBdEeSnyg6gfRbKJVGQqezvTmQ9G7FAbjStMNndIn5+GX+OaRB5Q90BzpmOQ0kug+2J6tcImuCxd9ZAFf6xbSzQ25CC8Y0Vkd2OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mvVNBUMS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvVNBUMS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3617C2BCB8;
	Sun, 10 May 2026 12:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778416347;
	bh=t7e25Wkq29joVUcS4ay/9eBhaqMriKfIr+VgmjLvpY4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mvVNBUMSAdNBJf3lsAC4leU+XCwmWDTZlR3zyRZkyzM4/VMu4vXs3+w/YfxBc+q/a
	 7JzHvzQF2ztfVlC7tNjkEkFbx/BG5H5w68foc7OJGTDNTn1CXmbAj5SpHh9JLAO2TP
	 AWjq5vTBt9KLq1mdz/3Xgb9RwWwz+QvWHIU8dMBf6RPuZ/DgtKUQ5rcU/LzNQVZtx7
	 OfT39JWwjMF88XcsFWM0rdDQ3o0+GAwnK1QnF1XG1Pe8iP/ACoDnmSKecyeiSNojr0
	 m/7WSa7VwKm2DCdsHs6i4zr1aqM1dlhTRflaGOLV74QJt/s+d2nqTqOM+s5TJp0eh+
	 1QqTzv/AHDevA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260211144949.1128122-1-alexander.stein@ew.tq-group.com>
References: <20260211144949.1128122-1-alexander.stein@ew.tq-group.com>
Subject: Re: [RESEND 1/1] phy: freescale: imx8qm-hsio: provide regmap names
Message-Id: <177841634355.434434.16023748532751572136.b4-ty@kernel.org>
Date: Sun, 10 May 2026 18:02:23 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 11 Feb 2026 15:49:48 +0100, Alexander Stein wrote:
> This driver uses multiple regmaps, which will causes name conflicts
> in debugfs like:
>   debugfs: '5f1a0000.phy' already exists in 'regmap'
> Fix this by using a dedicated regmap config for each resource, each
> having a dedicated regmap name.
> 
> 
> [...]

Applied, thanks!

[1/1] phy: freescale: imx8qm-hsio: provide regmap names
      commit: 057c81a17fffb17f66e5b4524d49b7caad3fe627

Best regards,
-- 
~Vinod


