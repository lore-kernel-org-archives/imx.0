Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563337;
	b=m/7wwYoyVu1+iPTQehT7MSmoPI21Dk/L/KlVIOpMh2j6XyzKFgZ9JDwrsV9qLiea5/Cz
	 z/6HDDd3+7i8kBgf2QMWUIQT29T/7T7ioH1ezYHDYjg6C1Obir1padlMWS/u7d1sjyExw
	 lD+B0gOY7NT234dqOo0nYeOlyk7os/TVNYG+hMdzHIeG3nBUO7H9bhbSrZMOlz52atmfj
	 Ts4BCND2tgnrY+5llY1OHpsfy2VY8Cj2cO2Q/5UR+xv57hMMUEpwKAxhn6uXq5vESsj/Q
	 ttj6J4WJmMYS5ARSkvz1odUInv/I2ws/DrD96bhL9s6jbKHzcSRXDMNU0J1WNWBqGOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563337;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=KLZgntFVdqduMiclbcA7VEofZFOcfwwrN4T8jD7UAF4=;
	b=C47soxSB5HxKwSRZ8eMFqi7OpdBEtIpEiP/9Au9m8WXeiR2HZG+6b2ru5HF00F4Rs1v+
	 5VQ/ONEvKIioZgYzWlAxWx8zbrEPU/kZWKlLxUoLQ+o1+9VkBX3AL4fphZ9TR6wL6I8kd
	 xkPEBCStEGREtv4pRJRUC0y5z3lOETrk3xxtHktHCmEGtG0rZyBW6Z4o80Szha/6qL7jb
	 22adZks9EHH7X4c7X6YfseNaHVnHgOD9/PJHbxSD9xzSS0yYW+mwDYjajzZRJQkuqxfBj
	 kqMNvLaPNsmFg6bBY7UqhCNHQf0K+F6rpPEt28uo3dYWT76KEWugF88J+vBCdMplcjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=V9gwQX1T;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103F2606A329;
	Sun,  1 Nov 2026 20:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 103F2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=V9gwQX1T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1793563328; x=1794168128; i=wahrenst@gmx.net;
	bh=KLZgntFVdqduMiclbcA7VEofZFOcfwwrN4T8jD7UAF4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=V9gwQX1TaNAQzBTmyDxcpgutMGksiGAlLhsKK0h7n/UHiKkMTMcqrK9E1/Av874J
	 seIO1g7ZOMRFMVSoG3Ct+kKKJXxUltr1/ChgLBT+eh9aevlukIR6xwKLdPGVZQYS6
	 s5YXyzaqR2D0W+zF9t43sgTzmKSWbdhzm9xhVmSPidalotUj8N7O/KkZe+g4fNRC+
	 VNwDHqwBjgbv5ohI0gnFjbyUW5P+fspRfx+6Fr8WAirpS7rc9f88BU8B13falc3RO
	 3JW9v4RQkhtQhLwp+7zdMLK1NcCx/Y8rCK6MiUnGDuVdD90/PavvmOyk2CvqdAIK+
	 7CSntsw1yjXGPKMf9A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MaJ7v-1x0KFp2Bt7-00KoIF; Sun, 01
 Nov 2026 21:02:08 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Bai <ping.bai@nxp.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 2/3] nvmem: Add driver for i.MX BBNSM GP register
Date: Sun,  1 Nov 2026 21:01:39 +0100
Message-ID: <20261101200140.141642-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101200140.141642-1-wahrenst@gmx.net>
References: <20261101200140.141642-1-wahrenst@gmx.net>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:stfVwjL5nRDW7hegiXOjryO0YyFv3NOTYl5nOitrm/eYlHLlzhs
 gqw/B+N8QuIFOr+yKROevEbMYdDghRxV3PCd6zj+TX2k3XbZ4P8XDH/fVXPPkmgXbv5n+aA
 dwOxjU7qmx8psaky6iEJd2MJefN15oukpmKvAkAt1fBi2emClk5epCux5KfIw70ao3AEexs
 Pi5yBdEJv+/ci2PKCcfig==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hA6YnnCidBU=;khj4SgqnJpoIivL9ufiA5ouJ5mm
 moZi5Y5NKykAg13G6PDjCDMQ1wgR2GJ+SpUn+1Hr/oTQNZabBkdhkNvkI2OPWhmyJ0swBChjv
 xZBKDnKf9T38uA5bStHvKjZS/wvnO763cqMwk99U5Meg1kz5r/IKhRgM13vxCWpyN4h9cYEM5
 59vWisQoo1iymHIoN90wBnDmBhv2fdmLfd7KWdC0QBYJyVePXJS0lWluIZrFBkAa/OeuNjGxa
 xs2xxnkTu/Uw38JpGFdSjmy43aieO4VSfZ+YlbpvN0VEF5qbP2hz22AcnFjCKrggYCvYQSAyT
 SImtqhMBZPBp4kvBGTYRtkbypDz/ayfPKE80PNemFBHAw6B6yJ3VbTBPOUvBg2/81Kr3C4Rw/
 vFyZfwsLhxm+b3agTnuZvyZbN0+dKa/mMt/sBLIguC6bDtPJb3CbGevNdweyX24j+bsApVwNS
 zaP8A9cfBTYg5mX2dZnDo1J7dR+tLo4vIQ/c0c+0wHZX+CrU8gmfYGhII/UrU99SJtZrhHw0o
 QuI8Ej4K3FN/tTvNIER8ZIyDnnXHGRlALaaJKGQF9sE1UWKx80C5w98VGuT7Pxmjzr7qViZSl
 Yi+yI4Bl52Re1K6mURk3IBq2a2H6i7zGMslvsu2KLDPn6Ul8YeShlFfXYjMfyzaHTPvvSv2tV
 lHX719BYYkx+qvE+2QIV4WYoFzQKFsEtjpNr69HYUfj32jKxgQR89h2vQLJVwuagUNy8wO50A
 F61Gyb/AidpxsWsihuEX3FME3Nx1FTOFwSwiOpFERY0tgN3I2VnYFOv41V6aJn1CO4gNZua0+
 I5j/xsI0AjDENQZaiJpyLgYI1PZ8w2r6n0M2EZ5R1igkMXAVo181TBv7ls7IAE+6WJfa8aYDn
 Z6MxtD0KCk6g4D2qbXqvqIyvdIjHIrQnRZ9G01sUpC4VZkHqEG2PNqCUP4iHZLnq9b1qj3XXG
 YnxcR/L32dld5xTfN4cG67iP2hK/iK4V4xvbbsnN7YVkjcUC/09H7S6Dd7aJq+H5YOlnaua6D
 R3DJjq6ukJvn8yR44JaoJrIHX/irRTkkjCBRmxbMLV+NIFNHc8Y96UhwfE43ZSjQbssBtuAZM
 I3RN5EZurFv7I23P6YDDj9EVUbKGDf6T0FyszuU8FB3yabnUEMqRFEFDU18z6ryfPiwH2CS66
 r+7aA8mkf0uQD/pjZVzEVTxlMMZHTNsRLJq+kLO5Pp74CWosVFz0lr9wpSzUrVSD2Ueo8gFNq
 WS0tZW8Paz9ho0zLXK0VNUyiAdGvKtAAarSZ50wxuqiAATNbsMPh3ZQxzN2YJ1czOS3AU53L0
 1N+uJVpF121EY0BTfI5gazX1F1L0C8+yHXqoTxm+y1W+Cq8oYQRfYKCGnYjFOWSwwd+2PvH+B
 VHBqTE4lVY/BRj1tLjtO0+KPDQBsbxeRv3D787MO/d0TJHQy6od7/nq/l0zaCHX3ppnwp0i82
 bLge6CrIoLF/V3164qULMN0WOAOPNRBp+DuFti1/DqCak2hKRhBlqHEw9htT5KTKjeqVgwyxt
 AA/gwW2h04q9sGCA6lBy1maWQHZSRqGx6QZ5HevmgHTyJ/FvkVnGBWqRniTvCdFAWvzm7CpQq
 8ZYnbeGcu/02vQyw9RhpkYsR9rfAYuJcX1zlbK0Sk8R6QqcURv1ZZAO986hZ9zaBbMg8I7EHU
 xiZ4wzpbZQUYVmzwg4/UgqWeY9BNDCXDRgEel/vRX24HNGUoMFJ7xKHjUyxtfdfsVCWYSxPct
 ODU3U62Omb56WrSh3Hpgf5XEnU2R6GwLcUgOHJvCScxR8ReAQxhKWI3+sOz2cPcDVQuW+N+5b
 S3jdtbPD90TZr3XsJNZF1UuKG9Wey68C6rdW1sIbkluAj0jZhJSglqHNAJx0l7kmrZsvssoCp
 6PNfua/ZVt7RlIqDd5xFsZTU2BnsyI5WsocP1Uwgcdm4HRYWhFtjK+VigN74hhkWTPTyKza/K
 Q8+vIYB+/OYmb7B0RtiA0LMV6ycX7j5z7uL9m1cCKpntCHvajNyImmlPE/ZvUxI/8EYypPQUO
 Aljr2GQRBBVGonGEHqDwyeBwUzT7szWTw8TBiDbEwZ7+ytMgKSI2/0XhhYsD42lg7a04HwgcJ
 ifg2T2kmuKCh/Lq6EsodgI/7s7l7oJYIlGvf8CUnWf9JTPACQjAPYUV3CwN9pid9it7dyFfmc
 vkLspTuRy/9UofAKG2vaoyjlGXnbaECTyXaua7F5UPVAD8z9OsSPGIwIa3nyY1ROK6jsnE+9N
 KEJ3BmPyFeWJ1OPRXLsIwPuqmsncVQo5joR7zlEg7ONractxzouKrhJQtgguKCSGgJ5JSx78O
 nkVW1i3Qu6I++87lie4ZyNnUAAkPW6uTffHYLbq9mk3UH7epTuKEx8oZNRbl8Uh6Qq5q9XmmZ
 d8ojvdVEtnvfH1/19eId9henW4M0hh68orW46JYDmgMiVXmz3j3DFW/NogTQKF9ztsQJJCiA6
 vkhGBFMDL/cWXMWgPrn+zammfU8wDbJpb3/xYuGmKkgx6bvBtmzGz0KJEWM8r6ClBZavMqxEu
 MhHN3CEx/hvbmsTw2PjZSDrIOxUi0ljd82Z5CXXVNYFxaN7EXrTR1V+pUDZcrw0nayKDPsAk8
 b7mJbmbbHsVzupncueBYdQFZfbxLaQnI3R1W0pC383DgwT6mP9Rs0GmdtL+i92wSIBHSYH3AD
 YyRbFrYldwjUo73YXWhp9bYxlusffi+Fif7Js/oip74WX6bapWI4Ip+aK4rfRD59gEI+/WxpE
 VXzRQEH+FyyxtLkxTFPTal9fanfqIA5OrlglPPL+MAnTQCJx4eHe9XoR0w4I0cYQQIokpJupO
 dEGeIcygrOP1Q/1A2ducPnWA4BC/zcbR5ptbdVANCgTlPFYdh65iPRqi0N+IaBKu4AKZ2k0Wg
 LHpTD+rDMDpQ0zDUAnbizk+/weWvLH5rA6UaFaLgBkkKBU9iX7jvQC+3dZUJnRjp9qV3Hgdlx
 twTrIxFJHhpODTahY297eILbbgf9TSYB3249Qq04jok8YUML/QNMesJJsUqON5uYMdrirmKcw
 sdbT0wTgRGuw3XrraMp0iIwZX5169ABjXxawx71tJPM7C0x543qhsGNmrFAdR5sdmHlUE4t0q
 S3wGMNWx7kRw4TYezDvrxDQGtRw9NfRMHuxnVERW+m5i6xHUseJn/UrT61NcYcWstHSMa22ZK
 M9SbKra+RT25wfmDm/G9ozl+jumSxxyo6JDYCQt5nPIcKQw+FKprJaA1tDr1C+CJdPegSKwOc
 fFihnR2LnGWytqUIaxCLPc3rsmcrdJPVRvX0y6KaT4yvDc3YlGqZZqghGqIaU2SKdILqmB81D
 iWC0CSEhtnnuEWrYs3cFYJmk8QhY/OrRGSYqKZgmaWMVnkS1WzhzQnx1OcCxopO7tcicPp5TW
 2UsSb5qvtUBC+kgsdVd9HPoqZ6WvKPcd3fGxxWBgbMEXCVtk0EmtafpIGJ7pSYGW7PENpVVqQ
 UYClBDxW0ZyDfZSLeK0emPEjoIJCVpGCpoDvyw3HXrkHBfQ1FdYkW0LVG2SADYAgTKujRWoY0
 lFLDFnQXzeyEWogPVVuPS7VDmIeVhAnqtahC/ghULdBTbYYTmP3yIhE0OVBfc7zczz1fIH5WC
 7I/XMbzhMohKkeGqOYZ2ikyQd3mK9Ani6PxvVwj+c+ukB8KedpSzRLNPxT63YzcYXEIssp71M
 WJcR+YPmLeseCMuicIjej4POol45oSTE8eY+h6PwbdynwJKHVqH4Uhzw9n4lpmfTXh6Yl9kTk
 mqdSizvitenDRh4PJ5mUZF3UJDg1Iyzv7n38/5E8YlNuUUR0qbAoTWYQ2KCVLNbGhJ82k/I3n
 /lzGNle06XW3y87hc6+gQJHZByYsJSuFnuDnrP5eNVDN82yTluo9RVjtmfKNfDrxdkh3IbnrN
 00WhVCCKM3skMFHpM2mAIxxLsOhKMdUQRLnEetUNiHQQneEN8Cx3+BOyhxeZNf1w7MkXcAEg/
 5WmWHn6Ec+QYFctmWX0sFfxtJ+0o8+cgnA42uDtzGKuVqe8ZU89B0k6BFKAnPjapz4qdTbudB
 DjqnJKnhLzwNf6a8pQKPxnBVrGxFYOk94sMVy7pijnhPGLrG5KFIC9S4r0EdFQ3FBof1AL2aO
 pqBaqN/1oNJ/vgGsntWTQU+xBYhbxzKE2/UhAQMwEchfLzv2tHwN7IAcO/kQ+KVco4cbwHmqq
 GXyqlbnzVPPlaJqzQB92wSw+uiJwM04KcUzNRBT4VAJ+vjDcifhLB8pKbJWDyhGgmysOH5UCv
 yELWbXW1CRu3nL0aBGqhzv74MSsObNA547F1jgK0Ll9BZmFZGlq3AYa3ootE+PuCEIfvi+Mwe
 ioRu8H6hvAI9SCz1dWbIRVh+oHSJnnsYcpXHViEreK/cfzGh2nD4pwp34J2g2t2LJT4TR60jR
 W6xUR2SRxtvBgQRf53TX0VCnDwadn+FNx2ZJIKuGgv8dpOAj8yHea+bcawDRstbthMOEtiN8Q
 91YSeijzhmG8alOedkGqej2PlR3GNzGqu4MyTCgDxBZ5P2//n64JN0Jnb7BUGUbYvVjnkQusq
 lrwWoBd7PeGKvgNYrJmtVxW3EeLT3UWCnRveczM5kcGkILBPFXfet4IIKP1Q3YP6WD7zA5/TI
 zimeRfR0wfMZ2e0GDyqAotBbLpqcKAq929Sc7V7KfXbP16iM1H9a7glheCca6WmrVZk+eoTaa
 dtJApFin0Np0mSyAgNS2hn9fi/xlVO4KWnuUfLsD4TGStlAreKV8YHHeZhyzfV1VKZIw8z0RS
 EFBKmWn2lDHWJpTG+1X6Z7xJZ4jMX4rvTzHNEffCYye/G6s4UOHRVIFnxeWbMNjCHFV59XGZG
 qQcFfGd/X7i1Gjdsi8mAaK4qmjl8O7SaMXlvAC4QJrYsj7O0rlp4qEMYNXRH1w/z09TyGHgRQ
 DElrCqT4Wm8IuvFq6A9t3HInjaSM5ZrL8UbZcntN9sU50YwnxVE3gCPyZ2y0kKJltocFocFw8
 BL5zbQs8haZW2WHZN0KYiPRTUXnvExq0z+g8IeYpVnKzqMI8wkc1/jXOJJbkKZOTF2Zj+szSQ
 pUHX7CV3d/sUE0/GyveeEzOFtx3rEyGIbpJynD0soRPHhGgBBoDQn6y79V9iuavQUc2ImiNEZ
 Xxw4/Za5L23/9f0u93ASU84VKGKE056IBKOB+cwIenzPg/EVcOa1PSoqjpXcd53P/ufc05jlb
 +3cXv6pdS6ExKWZN8EQ656DvsG/d11nnjIqT5xuRrulKX3db/Yinz2hojvREJkTPDeWvtcDkE
 V4CYYakpRIGC4JNpb4Prcu5QaKGS4/BpZFk2IbVuggMYLhApRSe85j4QRtDR2kmiQHlnojgSp
 3t6yQzZydqUy6DTpdiCGFRKxyDWQAxIw5znbctU8DLiETPPj4lw3rVzk5hgOlkpRUozD374uB
 ZaQbLT6v5EtJTtMfZj9k0nHTzkGw0S1VIhqd97/IMZp3Uac3FKmyBAURtNDF7Zr6bS1PMHv7K
 +2qQV+hxGYPzTI5tAFe84LE9bDais5g38Mm1AG6O0nxweDqeiwGeFwYKAJUc5ZrGfC9vfVai0
 3LNSuk5v0+mzE1LIFjRxFSEJd4e1OWtXU7N9/4I1NYvPoLXxf+v4T25YxnwzwH0zMW6yhX9FQ
 q7wGwpbJCrCMXGA6X43KOIl1eGk0+zQlF2TNkOtlmbigGUGOTje70rJBKmx7cp65dxdQTfiBx
 5sqpSsBv6tf1P6htS/gEFHgMuaOldZIaDdGqYXr6KqdVGn7kb3R8BSqZeMo8szipnhmbEKZEO
 Oov8MwqByTiYAUwBAaj+AzW9Qlf7GGXnmgFToY0yOFwwFbgSkQyJOaaMW7+dq4CYJUR8KZ95U
 lxB95WNC2+Vs1uKLMbKnUShy3bwekxrBp+zoY7CHmDqZKitJU6Kx3QdKVJUQksIBXgv+2wTrD
 0sUtpk4Q2P44P9Eu6iAD4hMg5RZ+SEqQ7MNG1a60KkXuW0025xQagpmVc1+Pw92MnPTPmkw8y
 +QlH/7RoAVEO2H5QhDn8LFaxPfebczCTIaujtqHQOAiDwqhZYk18SYIICGYRqoZMcInG4toi7
 NgMs3Lhr55UY9LDXIiOmDQ05V4OMVw9aR8KIf/ET46JqcWdOgSh5r2qqCn0Ed/EovVaZdbAqy
 8qNMZQBZqnIQA+uobSL6OcNT6SrxX1Ab246dIrG2I5yKvrL5gkdX1HXq5Y5AyJ4eqM9RU314d
 AHPUN5z5StQbE5q2TWDJep5zz59m4wf69JbE48BvzkqllVd/32FgcfWYmu5zvT9cGSe7S41cl
 dlbi0COuGUSYBiw93xzjrNypzr6XDA96mHhPc3Asw/3sFQdeVQZLt85idC7ngoeKW/DDHMEBR
 +JwI8SRgj3V6SnPwUVXUmARzoYMp27Sw/3t38saJMrXfL+o9HrYj+v1EVahmSJ3Jpt2Gin/Y8
 SXPKmG9IC4EQZCmu9WCNZ600iglqW7AmqtflizZXCSbUUE1Wu2J26mkS2tMbN4W2JsZpQRI0u
 UahwWSynqL9OOfFwAhaXFEVFkiyceeS9PVxVx1fgg2Xw1OcfYUyUOv68rrXfkxhdaBt2Zv/ee
 Ru7NWbZ3qtaxGOv31F/tI+NxO3RCkHPpVfq2IevovPTvZKQhU40UNHM2ZifFtYRM2vU7NGTnR
 6SHXWAIG4GlLHIUvv695PXQh1gbtRNf9UUXgCQUuuF7PUsJjXOikLXsGftsFlYLBmV3+YxmlZ
 UwOiz8bValgcicWGOKD+aN2pfQAuJKrHMsNjVTTxk/gNzBKZUAkiANjYC2EW8jmpIFaIS2DF9
 ZJlHI4Vdj9uEyKY4TbpBquE6C7l1L4W01P2Dd50/dEvUWBph6t3ac9UTs4Ki6XKFYZmWtFpvg
 Ylexyyy8naYceRlpuchLpofLg3QO84xdji6kQPKiz9Sslzsb0FszLnw7dwKI6NchWfgSJhOvC
 v1HLiz8omz0uqu4T2PW3envdwRZTQhNlY2JmJkvkdGWx399s0OTqFMQzX/2FBkvBIbfAb700G
 F5InC5QcA/ypAR9XII+K89XSYNfHwA2Ece7ZC0DxKRQfHVfuDgHoHmcbFruBOsuG/DPMucUJE
 pyRD0EY3sQOjcnDSeeSdCfjg7B38zgHjft/ZKWUAWbH9a6a2HLLAcoTAtyBS1I5ZKD+2RAofr
 LGloAjkHvcQRQN5fAeko6yietiLYl6yZur0IYMWjHDarBLqr+UNduymAxVrnU2LjH4Z22L+Md
 ziLGBbSa11/EILk4euJWGgkkVjP9b0NpO/jRufMNcyI7OXtxMXYZWAYQNrZL8SlDEXZp05O75
 aH/vKX96gyk6y79aetlsdsdQexp7CO9BBft+Nk2sjN5r3rdfSCasjlC2aT19W4EskeWvYi1DI
 zUsV8as0ttL8pPG0tNBgMEDqQTzmeIYPMgAaENQd3i4kZN1XQeL9I1aoDyHNnNc0dfpko23f3
 G7sW8c7I0ALWsN85uPHo7FA00ZBtP30LoDVKBUwmw/FcJ+pZ3ic4HKYV16r/4ZjYuPwjGUAJK
 kyr2Eg69P1xfFoJAgJ6Qi8m3HhehAkfniuExsbDb/SPuCYestJjHrYvs5aIPMR8pIa1JMLEHS
 sPGPZPv6K3MENlfVbUM2yqwsp079Wa3DqLv/KbnYxqM+BGnJDKfxw38Ty+QfRZyoEe4to6X3j
 KTc4icfTiJyuUO33y6AgJx3GgpVwcr39RmfY2VR2gikRZQFbc/P+gbG5gM6rNQN72mlqMtnwT
 LnDqKPffLXUCxsWLMmkk0NKHnVWKeEePBpEkXC/5e1QK0UztSUzELP+GAI72TXqHtdi+WDql5
 zPoVkrHotnxTWPJZlSLZNc7nYs5ULbL8YcOiL21SHvtVPXrNL56zATjhTi0TtCHUmlk3B62A3
 og2OeBNhE0/veKHxfiZvUssJTBGCOaQtyx5VUA==

The Battery-Backed Non-Secure Module (BBNSM) on i.MX9 SoCs can have
some general purpose registers, which retain their data on power-down.
This driver make these register accessible via NVMEM subsystem.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/nvmem/Kconfig     |  12 ++++
 drivers/nvmem/Makefile    |   2 +
 drivers/nvmem/imx-bbnsm.c | 116 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 drivers/nvmem/imx-bbnsm.c

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index d2f5bb236663..d238186b1216 100644
=2D-- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -185,6 +185,18 @@ config NVMEM_BRCM_NVRAM
 	  This driver provides support for Broadcom's NVRAM that can be accessed
 	  using I/O mapping.
=20
+config NVMEM_IMX_BBNSM
+	tristate "i.MX BBNSM general purpose register support"
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on OF
+	select REGMAP_MMIO
+	help
+	  This is a driver for the general purpose registers available in the
+	  Battery-Backed Non-Secure Module (BBNSM) on i.MX9 SoCs.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nvmem-imx-bbnsm.
+
 config NVMEM_IMX_IIM
 	tristate "i.MX IC Identification Module support"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
index 5e70bad9f0f9..ec54e83da46a 100644
=2D-- a/drivers/nvmem/Makefile
+++ b/drivers/nvmem/Makefile
@@ -27,6 +27,8 @@ obj-$(CONFIG_NVMEM_BCM_OCOTP)		+=3D nvmem-bcm-ocotp.o
 nvmem-bcm-ocotp-y			:=3D bcm-ocotp.o
 obj-$(CONFIG_NVMEM_BRCM_NVRAM)		+=3D nvmem_brcm_nvram.o
 nvmem_brcm_nvram-y			:=3D brcm_nvram.o
+obj-$(CONFIG_NVMEM_IMX_BBNSM)		+=3D nvmem-imx-bbnsm.o
+nvmem-imx-bbnsm-y			:=3D imx-bbnsm.o
 obj-$(CONFIG_NVMEM_IMX_IIM)		+=3D nvmem-imx-iim.o
 nvmem-imx-iim-y				:=3D imx-iim.o
 obj-$(CONFIG_NVMEM_IMX_OCOTP)		+=3D nvmem-imx-ocotp.o
diff --git a/drivers/nvmem/imx-bbnsm.c b/drivers/nvmem/imx-bbnsm.c
new file mode 100644
index 000000000000..4fe96161834e
=2D-- /dev/null
+++ b/drivers/nvmem/imx-bbnsm.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * i.MX Battery-Backed Non-Secure Module general purpose registers
+ *
+ * Copyright (c) 2026 Stefan Wahren <wahrenst@gmx.net>
+ *
+ * Based on snvs lpgpr driver,
+ * Copyright (c) 2015 Pengutronix, Steffen Trumtrar <kernel@pengutronix.d=
e>
+ * Copyright (c) 2017 Pengutronix, Oleksij Rempel <kernel@pengutronix.de>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/nvmem-provider.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define BBNSM_FEATURES		0x4
+#define BBNSM_GPR_SZ_SHIFT	2
+#define BBNSM_GPR_SZ_MASK	GENMASK(7, BBNSM_GPR_SZ_SHIFT)
+
+#define BBNSM_GPR		0x300
+
+struct imx_bbnsm_priv {
+	struct regmap		*regmap;
+	struct nvmem_config	cfg;
+};
+
+static int imx_bbnsm_read(void *context, unsigned int offset, void *val,
+			  size_t bytes)
+{
+	struct imx_bbnsm_priv *priv =3D context;
+
+	return regmap_bulk_read(priv->regmap, BBNSM_GPR + offset, val,
+				bytes / 4);
+}
+
+static int imx_bbnsm_write(void *context, unsigned int offset, void *val,
+			   size_t bytes)
+{
+	struct imx_bbnsm_priv *priv =3D context;
+
+	return regmap_bulk_write(priv->regmap, BBNSM_GPR + offset, val,
+				 bytes / 4);
+}
+
+static int imx_bbnsm_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct device_node *parent;
+	struct imx_bbnsm_priv *priv;
+	struct nvmem_device *nvmem;
+	u32 gpr_words;
+	u32 features;
+	int ret;
+
+	if (!dev->of_node)
+		return -ENOENT;
+
+	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	parent =3D of_get_parent(dev->of_node);
+	if (!parent)
+		return -ENODEV;
+
+	priv->regmap =3D syscon_node_to_regmap(parent);
+	of_node_put(parent);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	ret =3D regmap_read(priv->regmap, BBNSM_FEATURES, &features);
+	if (ret)
+		return ret;
+
+	/* Are any general purpose register available? */
+	gpr_words =3D (features & BBNSM_GPR_SZ_MASK) >> BBNSM_GPR_SZ_SHIFT;
+	if (!gpr_words)
+		return -ENODEV;
+
+	priv->cfg.dev =3D dev;
+	priv->cfg.name =3D dev_name(dev);
+	priv->cfg.owner =3D THIS_MODULE;
+	priv->cfg.priv =3D priv;
+	priv->cfg.stride =3D 4;
+	priv->cfg.word_size =3D 4;
+	priv->cfg.size =3D gpr_words * sizeof(u32);
+	priv->cfg.reg_read =3D imx_bbnsm_read;
+	priv->cfg.reg_write =3D imx_bbnsm_write;
+
+	nvmem =3D devm_nvmem_register(dev, &priv->cfg);
+
+	return PTR_ERR_OR_ZERO(nvmem);
+}
+
+static const struct of_device_id imx_bbnsm_of_match[] =3D {
+	{ .compatible =3D "nxp,imx93-bbnsm-nvmem" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, imx_bbnsm_of_match);
+
+static struct platform_driver imx_bbnsm_driver =3D {
+	.probe =3D imx_bbnsm_probe,
+	.driver =3D {
+		.name =3D "imx-bbnsm-nvmem",
+		.of_match_table =3D imx_bbnsm_of_match,
+	},
+};
+module_platform_driver(imx_bbnsm_driver);
+
+MODULE_AUTHOR("Stefan Wahren <wahrenst@gmx.net>");
+MODULE_DESCRIPTION("i.MX BBNSM general purpose register NVMEM driver");
+MODULE_LICENSE("GPL");
=2D-=20
2.53.0

