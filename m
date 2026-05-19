Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20A9481FB7
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189188; cv=none; b=uGKTRdSAN6TcNwBkUiJ3+H1zzDrsE5Kh3CMGpg6r6q+jjVaAZp/NLa0Awr7mrbdGgOElHLdsABWLfVG/0RU2MA03ke1tWVdV37UkiVSlEIPmk/Hs9voDvVqX5IWWMzt889myftFP1mZ99IpZXr3TEZYyzCe42D5TPP2/nVAiOeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189188; c=relaxed/simple;
	bh=sH5sLDkRFmb8i3vVXIE9z6cWBkiVrm/dOrR+MgKQxUQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O9V6PlUJTBBGYYYGEyd+pwgvpFOqMh0UJX8aHzf2IvkysU6Vs15wWJg5biVCJ2dMfrKWskvWnMRSWTJabJGA9jcjmI/lp76YrhOH5lZHmkOBL0G+gfMcdFAgG9Kj+qfQpSzL43JqwkPQ8rxL1QtTsV9+I85QAb5466y5337AdmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkTsJNQA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkTsJNQA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B27C2BCC6;
	Tue, 19 May 2026 11:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779189186;
	bh=sH5sLDkRFmb8i3vVXIE9z6cWBkiVrm/dOrR+MgKQxUQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=HkTsJNQAhx6WzYp6JLNEvlm0RRTxVWTa8XwCm7JVYU7mogOevejWs0m3O3p5cHVcO
	 7y5nn9ZYJQ5rNglEF/1+QMoTvR4NRWB5JmOR67ZTvAObu2RH+t8QR2boX2FFUc7ZJ7
	 O8MMmFMHpesrUyx15oU/YPEnosYJopgSZxHANQGzTbN9jb9hrYlApe+jMBt7EtBS6X
	 7u20WTAR1L1xV/jQjHt3hihmiF5qDcVq66P2alzjs5xs0/ES99ANm8AfBpZbPAt5PA
	 NQz8k+hhsrK4V7uoTHYRis86xdDWEawmI4koRkX4q7LTogO84D8IiJhXxyEJCyiN+l
	 aUCiacC+NwDiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 29/37] drm/mipi-dsi: notify about DSI attach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519-drm-bridge-hotplug-v1-29-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-29-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:13:03 +0000
Message-Id: <20260519111304.B9B27C2BCC6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message incorrectly claims that the attach event will=
 trigger deconfiguration and unregistration.
--

commit 24c698fb4d9fc9ee14ca2fe29864b46f2adbe654
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/mipi-dsi: notify about DSI attach

This commit introduces a notification event when a DSI device is attached
to its host. This change is made in preparation for supporting DRM bridge
hotplug.

>     In preparation to support DRM bridge hotplug, let the drm_mipi_dsi co=
de
>     emit an event when a DSI device is attached to the corresponding DSI =
host,
>     so that this event can trigger the actions needed to deconfigure the
>     pipeline and unregister the connector as appropriate.

This isn't a bug in the code, but does the commit message describe the wrong
actions for an attach event? Attaching a device typically triggers pipeline
configuration and connector registration, whereas deconfiguration and
unregistration are normally associated with a detach event.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D29
