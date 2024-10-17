Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EE11E0488;
	Thu, 17 Oct 2024 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729179376; cv=none; b=J6nKQXqbfnMDKx39xltKwdA5HE9hTKcMP3uZzxY/fpUnxaZeGqhCWZ85CiM0dYCElgAv2tXV38aXkWSp32sMghIcDGXWnG22ARn+rBQiWPG9RwWvkgP7qevdKujITi4K+HNWfVgMggoITHGA6vH+ZL2IeBzhYYANo67CNaMqhwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729179376; c=relaxed/simple;
	bh=X1eI/8AVbiXiB8bDbaWcMyqlmgmxwjsD163dTCzZshw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LDvqJPJ6il0kxqLwr4rAnzTpbcplQTxoTq0p+F8VW1WiXzT4mNjIUC6urxbYyhWU+0HGNO5VFRD9P7QqgVs+LCooCTU5+b/aaepfn0WxWgr4WmRm1PKLgaOMAstQNhbmj0FBLvUM0l+QAF7whN0T61The0ODEEjZpunXfWiAmqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IxA3lyHF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IxA3lyHF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB063C4CEC3;
	Thu, 17 Oct 2024 15:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729179376;
	bh=X1eI/8AVbiXiB8bDbaWcMyqlmgmxwjsD163dTCzZshw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IxA3lyHForTD5d2NzhQQSAFlwoHfXtPL/NyveBg49zUg4SDKM9Gq1OnJDluZMewDn
	 ID0CyXDJXADHOG2DSaTG85odM9sHq+/0YdUFF5EQ4ROxGryYq5Ux36TFEgTyXqrWpM
	 PGeQdrpL8DJ9dpxDlG5+UO6bKmBPj78q+cIeUPaqgSW2Spz9Jo/58iDrwzDx1JArs+
	 8RdyYTaub07LXdGbMR3pZrytTANuaPYIyDUwRtdShEpm6XOSm/PZF0TCFES5dJDu2z
	 6ETsOxbEyTX4p1D4nb8k7O32xU4225R+eZB5aS47bTfkIjKp1PIP7n/S7mm/Pr4LmH
	 H0lr22qVhrIIg==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, Xu Yang <xu.yang_2@nxp.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240926073951.783869-1-xu.yang_2@nxp.com>
References: <20240926073951.783869-1-xu.yang_2@nxp.com>
Subject: Re: [PATCH 0/5] dtbs_check warning clean up against
 fsl,mxs-usbphy.yaml
Message-Id: <172917937246.288841.15901592420939223719.b4-ty@kernel.org>
Date: Thu, 17 Oct 2024 21:06:12 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Thu, 26 Sep 2024 15:39:46 +0800, Xu Yang wrote:
> Some changes to clean up dtbs_check warning against fsl,mxs-usbphy.yaml.
> 
> The first 4 patches are used to fix below warning, "nxp,sim" is only
> needed by i.MX7ULP:
>  - 'nxp,sim' is a required property
> 
> The last patch is used to fix below warning:
>  - fsl,tx-d-cal: 5 is less than the minimum of 79
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: phy: mxs-usb-phy: add imx8qxp compatible
      commit: 76b4f2a5cec59e842de4b5989eb990a2ee8cedf3
[2/5] arm64: dts: imx8dxl-ss-conn: change usbphy1 compatible
      (no commit info)
[3/5] arm64: dts: imx8qm: change usbphy1 compatible
      (no commit info)
[4/5] arm64: dts: imx8qxp: change usbphy1 compatible
      (no commit info)
[5/5] ARM: dts: imx6qdl: convert fsl,tx-d-cal to correct value
      (no commit info)

Best regards,
-- 
~Vinod


