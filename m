Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CC027A462
	for <imx@lists.linux.dev>; Thu, 15 Oct 2026 01:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028639; cv=none; b=XWw0ANFElF5hBQA5xBtZ9PbAKAD2xDVFD0M0EnNRgEaDdIn+2ztnloSYpq50ACJKC4PznW44hAhpFfsEEe7J3nBPSIhWEcS6HLmqtzLBEn1FZVxAoDyHmvZZzq5694yaoHqwkWynIqZz+GlZPLDEjwErPkwf2Qpv5I0OpA9es2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028639; c=relaxed/simple;
	bh=AsEVJmW9HdZ7itXRTksJcaPnMCR5//7NyJ3suWMaEoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eeKcoKsXSxbKz9O0IW2L5QDFxuESnmUQmsUwzchV5RJYInY5IfmlsNZ4gv1oaq4wc1moFxEAU3KG38NNNm50WJUVqvVNr7T6/0x00/52oLRGYoxrcwSy4rGTrygA7NaNeXaXItSXRugqpnNSYHMpqMfaiIqnXsBWndV4GvRO3K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FoBwy+gL; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FoBwy+gL"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so3241280a12.0
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 18:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028636; x=1792633436; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=geVeIRJMETVZrOFQgXZr74ay0B29FFoh4B/JZUuVWw0=;
        b=FoBwy+gLJ8DBXSUW3NfXKy3elQSHLglf5H7Ppgf9GWwFiDgiAacgjxZr8mzVbcfiv2
         5MHOmEUbxXXg/ZxRg5UFqk4OBziSwmVBQqNGuPmTT2f7OaFg3FvUK8VvgEN4apYl1d4L
         iMNwicKg6Qg58Dfd81koZrJeFB0J+A7YFl+c6BZFi2QgDLZvanmMCdosf44dqWa2CPBR
         jq5zjs3883pjexZvOLxnK8ncjLalw+xG2ZOdpBR4yvGPDOojeb82r48k3wWGdmFBPnei
         k60ubaFZMO1G0NnKGEWgsTeuGKuBKPftaEPY04qjKia67Dxy6mFP8e+I7yFFhqinwfaU
         40Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028636; x=1792633436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=geVeIRJMETVZrOFQgXZr74ay0B29FFoh4B/JZUuVWw0=;
        b=Ov2tpCWnjRDAlhgMei8rAMbXooxvrorMNXx3YlS+Daj+WZvPP9x107uzob8T+rwaGa
         2Kh8tkJ9PcgaWo2DlW2e5+BOpAsCcOhia0n+S090ZDUi5knjFP+8quqtIDNBicb4jiCa
         LuzW/XUuAHtCxEkAD1D3B4JjsqRJ8Xs7dJ+SPOhhuJBzximxoT1QYyu3md8/XM5J86Ce
         yfpzZxkyC2Ry7CYF/LZ0jZHMI6Fv4vtF5zYAXsrQascLf6/u90AqAZbdzZFVE8CzhHjn
         9L+wdVMpZ9zT3WnIvw/MxmYD98RXGTWGCKeQaoSYjF/moKUuSKebtYU7u9OGrVOUKXdD
         ypJg==
X-Forwarded-Encrypted: i=1; AKwUvBybrcBT439RE9dstt88eH85M1GHZP9mZqP/8Eoo2p8JZXGjYlOyaNw35xlOc6rYy29Q1uI=@lists.linux.dev
X-Gm-Message-State: AFq9FYJqHgkY2hjCDlouDZNYKu9REaGIGhHxIpJmSTBGrZRUQjVWBbgJ
	lht0OGXhUVwBFIKG2ZRphCv4hRqxnwwLNfqN8nb+jTQsVj1/ADIV1re7
X-Gm-Gg: AYBFou0KTXG50+z854MzZdKhiIS0GyuvNRZ0CnQP6ThwVd30Az+WOk/+GVZq37jPpUK
	04UHuemEq7BLTB7IWcJeBFNy8tL5tXhxmSUwICL691s4XaXNluh4YYQcH4Z6xK0pRsntKHJoH7k
	724XjMZuRaeVGHVM9CS5O+79d8OaDIhYoMVyroLEUjFxMnhBKjRtjbECqWpuKXmCKw4u22JPqdE
	nFO4JNku7JI5ZKMC8U+dK1bK562zSrD1YLzj/g4gk0QzbxOu1hlq4FzgkV0GinG77AF7x6ZwIDo
	x+3cBm6WHaX7bM8IPfbiXCGCijF49Rp7dm3ytU/IWKXJ8F14d8D8huP1DnrIDH6b0X/p37hGBMi
	IBTHE3sBgIQJqKP79IhX0Ihm8ciMExAYXZFMkkICcLy152hL1hJvCMuj/V41YYrWApNSyqiH6iQ
	KwKUxsvGvkQSamS/FRrTJGkhx1ERhHnPaGY93whg39rapdNOCbm7vZp74sE2IRgq+NxKzukVf/9
	dFGfovmT9SkHCQWMCNFvB/KYFGzihbBCRo/J6aPN+CwQxlWB1hB5PtoM36+Mta+D+S0lyp0V6jl
	AYSgrYoUnvxMLA==
X-Received: by 2002:a17:90b:4a49:b0:3ac:a167:8542 with SMTP id 98e67ed59e1d1-3aca16787f0mr98748a91.30.1792028636097;
        Wed, 14 Oct 2026 18:43:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8cc1sm73202995ad.54.2026.10.14.18.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:43:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	povik+lin@cutebit.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>,
	Syed Saba Kareem <syed.sabakareem@amd.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	Chris Bainbridge <chris.bainbridge@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	u.kleine-koenig@baylibre.com,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Md Shofiqul Islam <shofiqtest@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Zain Aboobacker <zainaboobacker33@gmail.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Bo Shen <voice.shen@atmel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 00/25] ASoC: Fix constraint return value handling
Date: Thu, 15 Oct 2026 08:42:59 +0700
Message-ID: <20261015014324.5569-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

snd_pcm_hw_constraint_minmax() and snd_pcm_hw_constraint_integer()
may return positive values on success. However, ASoC only marks the
DAI, link, or component as started or opened when the corresponding
callback returns 0.

This series fixes affected ASoC drivers to return 0 on success and
properly handle rollback paths.

Found by manual code inspection.

Compile-tested only.

Link v1: 
https://lore.kernel.org/all/20261008103831.542533-1-phucduc.bui@gmail.com/

Changes in v2: 
 - Add Reviewed-by tags from Vijendar Mukunda and Chancel Liu.
 - Remove redundant integer constraints already applied by 
   snd_dmaengine_pcm_open().

Best regards,
Phuc

bui duc phuc (25):
  ASoC: amd: acp: Fix .close() being skipped on rollback
  ASoC: amd: ps: Fix acp63_pdm_dma_close() being skipped on rollback
  ASoC: amd: ps: Fix acp63_sdw_dma_close() being skipped on rollback
  ASoC: amd: raven: Fix acp3x_dma_close() being skipped on rollback
  ASoC: amd: renoir: Fix acp_pdm_dma_close() being skipped on rollback
  ASoC: amd: vangogh: Fix acp5x_dma_close() being skipped on rollback
  ASoC: amd: yc: Fix acp6x_pdm_dma_close() being skipped on rollback
  ASoC: apple: mca: Ensure the DAI is marked as started on success
  ASoC: atmel: atmel-pcm-pdc: Fix atmel_pcm_close() being skipped on
    rollback
  ASoC: codecs: cs42l42: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8325: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8540: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8821: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8824: Ensure the DAI is marked as started on success
  ASoC: codecs: nau8825: Ensure the DAI is marked as started on success
  ASoC: codecs: wm8580: Ensure the DAI is marked as started on success
  ASoC: codecs: wm8782: Ensure the DAI is marked as started on success
  ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close() being skipped on
    rollback
  ASoC: intel: atom: Fix .shutdown() being skipped on rollback
  ASoC: renesas: fsi: Ensure the component is marked as opened on
    success
  ASoC: renesas: msiof: Remove redundant period constraint
  ASoC: renesas: rz-ssi: Ensure the component is marked as opened on
    success
  ASoC: renesas: rz-ssi: Remove redundant component open callback
  ASoC: rockchip: rk3399_gru_sound: Mark the link as started on success
  ASoC: rockchip: rockchip_max98090: Mark the link as started on success

 sound/soc/amd/acp/acp-platform.c             |  7 ++++++-
 sound/soc/amd/ps/ps-pdm-dma.c                |  8 +++++++-
 sound/soc/amd/ps/ps-sdw-dma.c                |  8 +++++++-
 sound/soc/amd/raven/acp3x-pcm-dma.c          |  8 +++++++-
 sound/soc/amd/renoir/acp3x-pdm-dma.c         |  8 +++++++-
 sound/soc/amd/vangogh/acp5x-pcm-dma.c        |  8 +++++++-
 sound/soc/amd/yc/acp6x-pdm-dma.c             |  8 +++++++-
 sound/soc/apple/mca.c                        | 16 +++++++++++++---
 sound/soc/atmel/atmel-pcm-pdc.c              |  7 +++++++
 sound/soc/codecs/cs42l42.c                   | 16 +++++++++++++---
 sound/soc/codecs/nau8325.c                   | 16 +++++++++++++---
 sound/soc/codecs/nau8540.c                   | 16 +++++++++++++---
 sound/soc/codecs/nau8821.c                   | 16 +++++++++++++---
 sound/soc/codecs/nau8824.c                   | 16 +++++++++++++---
 sound/soc/codecs/nau8825.c                   | 16 +++++++++++++---
 sound/soc/codecs/wm8580.c                    | 15 +++++++++++++--
 sound/soc/codecs/wm8782.c                    | 12 +++++++++++-
 sound/soc/fsl/imx-pcm-rpmsg.c                |  8 +++++++-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c |  7 ++++++-
 sound/soc/renesas/fsi.c                      | 11 +++++++++--
 sound/soc/renesas/rcar/msiof.c               | 16 ++++++----------
 sound/soc/renesas/rz-ssi.c                   | 19 +++++++++++--------
 sound/soc/rockchip/rk3399_gru_sound.c        | 14 ++++++++++++--
 sound/soc/rockchip/rockchip_max98090.c       | 15 +++++++++++++--
 24 files changed, 234 insertions(+), 57 deletions(-)

-- 
2.43.0

