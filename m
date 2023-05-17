Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE67101D9
	for <imx@lists.linux.dev>; Wed, 17 May 2023 16:12:08 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2502f2854b2so211018a91.0
        for <imx@lists.linux.dev>; Wed, 17 May 2023 09:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684339928; x=1686931928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVR94kxf1clYzcJ4fp0jCloix0aQfZY3EqXNWwNKOks=;
        b=UaqAHC/mMJsApBK211+7ZcIdS+M/0pzqe3D2gkJvnQyy0KQQc/E0DQtR+nENbT+FVw
         d9DrjU/7JjjDK/56zIJU733sZiBURi0nxxvzl5AsWJnG7I/KOzAdty6GiWxvnyoEJi1a
         JKgqI5+SEOjhLoD1nWjqAK19YHpzSA8H/MsaCKTDAmyms1NCxNpwUz7iYsZmRj3jZMAt
         qU2x3ZYOEDyjUNpJaI7pS3U4SfdTR9sI3EMUxqDQPaEoXgzxCnZiVzs3MJ2YPctYlvNV
         MQp4ks7I1rnLbnZHFP4pPxJDbpXqtMqcUwnbLvl2ESpHXg1RngJwlGysrqnxyHE3fQDD
         UHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684339928; x=1686931928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVR94kxf1clYzcJ4fp0jCloix0aQfZY3EqXNWwNKOks=;
        b=LC57mhhVPQLDbgxq+yZsA2OYMXnfeQiijV7WH6bxSFVtVfvRkrnQaclIkI0m4Y4BEa
         FnzFLrDlNZlbWtgOeGGqd5hyR2uyrKDKb7acGE0ZsCVfR877d7tnG/18VPaUY/g3ewa9
         Jsu2ogO5GhYaATsHtS4Fd+alA2iDxJByQWu4RONdCOiQiHpc+6Q5yZbtH9Pb2Teq9Y4J
         InLE0Tmy9GXxORotqfdmXIaD4HxCFWlCniIhmXaxGPL9TzMS7ie7Vh+B4laTQ21NDlcg
         TSavghmPnDr9PoBqruqNkzDllQJpqtioJIth/vyWOC6LLATNHnNu/gHRS8X4pAodUBkh
         kXag==
X-Gm-Message-State: AC+VfDxLUcmxas2ROytFEgIphe5W9C4p3St6TEG5LMAFbQgwx6E9otgW
	mvvVA4nOuyEHQLfz1MkfbvqASBHrCB0BRM3bAUE=
X-Google-Smtp-Source: ACHHUZ4RNj6D8++Db3J1u664nVktSsN/kygU+dAai3TruNVjwa+LRVDa4CatTLuND3FF5uDF3o2oUuC1F9x6p2WoD5M=
X-Received: by 2002:a17:90b:3b43:b0:250:9af3:4f89 with SMTP id
 ot3-20020a17090b3b4300b002509af34f89mr3932593pjb.4.1684339928220; Wed, 17 May
 2023 09:12:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230517160840.1862018-1-shenwei.wang@nxp.com>
In-Reply-To: <20230517160840.1862018-1-shenwei.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 17 May 2023 13:11:56 -0300
Message-ID: <CAOMZO5DfBtE6qn0Pt7AkJMZRoo4n9mpH_TYZmf3wJknKecNMGw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx: correct GPIOs for USDHC2 CD and WP signals
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shenwei,

On Wed, May 17, 2023 at 1:08=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com>=
 wrote:
>
> The USDHC2 CD and WP sginal should be on LSIO_GPIO5.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

In the Subject line, please put "imx8qm-mek" instead of "imx".

What about adding a Fixes tag so that this can be backported to stable kern=
els?
